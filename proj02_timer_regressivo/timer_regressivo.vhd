-- Importa a biblioteca padrão do IEEE
LIBRARY ieee;
-- Importa o pacote para trabalhar com tipos lógicos padrão ('0', '1', 'Z', etc.)
USE ieee.std_logic_1164.ALL;
-- Importa o pacote para operações matemáticas e conversões numéricas
USE ieee.numeric_std.ALL;

-- Declaração da entidade (interface de entrada e saída do circuito)
ENTITY timer_regressivo IS
    GENERIC (
        -- 50.000.000 ciclos equivalem a 1 segundo exato com o clock de 50 MHz da placa
        MAX_COUNT_1HZ : INTEGER := 50000000;
        -- 50.000 ciclos equivalem a 1 milissegundo (1 kHz) para alternar os displays sem piscar
        MAX_COUNT_MUX : INTEGER := 50000
    );
    PORT (
        clk       : IN  STD_LOGIC;                    -- Entrada do cristal oscilador de 50 MHz (Pino E1)
        btn_start : IN  STD_LOGIC;                    -- Botão RESET usado como Start / Pause / Parar Alarme (Ativo em '0')
        btn_sec_u : IN  STD_LOGIC;                    -- Botão KEY1: adiciona +1 na unidade de segundo (Ativo em '0')
        btn_sec_d : IN  STD_LOGIC;                    -- Botão KEY2: adiciona +1 na dezena de segundo (Ativo em '0')
        btn_min_u : IN  STD_LOGIC;                    -- Botão KEY3: adiciona +1 no minuto (Ativo em '0')
        buzzer    : OUT STD_LOGIC;                    -- Saída para o Buzzer da placa (Pino C11 - Ativo em '0')
        sel       : OUT STD_LOGIC_VECTOR(5 DOWNTO 0); -- Seleção dos 6 anodos do display (Ativo em '0')
        dig       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)  -- Barramento dos 8 segmentos: DP e G até A (Ativo em '0')
    );
END timer_regressivo;

-- Início da arquitetura que descreve o funcionamento interno do circuito
ARCHITECTURE behavior OF timer_regressivo IS

    -- Flags de estado do sistema
    SIGNAL running       : STD_LOGIC := '0'; -- '1' quando o cronômetro está descendo, '0' quando pausado/configurando
    SIGNAL alarm         : STD_LOGIC := '0'; -- '1' quando a contagem chega em 0.00 e dispara o alarme contínuo

    -- Registradores de deslocamento (2 flip-flops) para sincronizar os botões com o clock e evitar metaestabilidade
    SIGNAL start_sync    : STD_LOGIC_VECTOR(1 DOWNTO 0) := "11";
    SIGNAL secu_sync     : STD_LOGIC_VECTOR(1 DOWNTO 0) := "11";
    SIGNAL secd_sync     : STD_LOGIC_VECTOR(1 DOWNTO 0) := "11";
    SIGNAL minu_sync     : STD_LOGIC_VECTOR(1 DOWNTO 0) := "11";

    -- Contadores de filtro de ruído mecânico (Debounce de 20 ms = 1.000.000 de ciclos a 50 MHz)
    SIGNAL deb_cnt_start : INTEGER RANGE 0 TO 1000000 := 0;
    SIGNAL deb_cnt_secu  : INTEGER RANGE 0 TO 1000000 := 0;
    SIGNAL deb_cnt_secd  : INTEGER RANGE 0 TO 1000000 := 0;
    SIGNAL deb_cnt_minu  : INTEGER RANGE 0 TO 1000000 := 0;

    -- Sinais dos botões após passarem pelo filtro de debounce (estado limpo e estável)
    SIGNAL start_stable  : STD_LOGIC := '1';
    SIGNAL secu_stable   : STD_LOGIC := '1';
    SIGNAL secd_stable   : STD_LOGIC := '1';
    SIGNAL minu_stable   : STD_LOGIC := '1';

    -- Guardam o estado do botão no ciclo de clock anterior (usado para detectar a borda de descida / clique único)
    SIGNAL start_prev    : STD_LOGIC := '1';
    SIGNAL secu_prev     : STD_LOGIC := '1';
    SIGNAL secd_prev     : STD_LOGIC := '1';
    SIGNAL minu_prev     : STD_LOGIC := '1';

    -- Contadores dos divisores de frequência
    SIGNAL count_1hz     : INTEGER RANGE 0 TO MAX_COUNT_1HZ := 0; -- Conta até 1 segundo
    SIGNAL count_mux     : INTEGER RANGE 0 TO MAX_COUNT_MUX := 0; -- Conta até 1 milissegundo (varredura do display)
    SIGNAL mux_sel       : INTEGER RANGE 0 TO 2 := 0;             -- Aponta qual dígito está aceso agora (0=SegU, 1=SegD, 2=Min)

    -- Registradores que guardam o tempo atual da contagem regressiva (formato BCD)
    SIGNAL sec_uni       : INTEGER RANGE 0 TO 9 := 0; -- Unidade de segundo (0 a 9)
    SIGNAL sec_dez       : INTEGER RANGE 0 TO 5 := 0; -- Dezena de segundo (0 a 5)
    SIGNAL min_uni       : INTEGER RANGE 0 TO 9 := 0; -- Unidade de minuto (0 a 9)

    -- Sinais de controle sonoro (Buzzer)
    SIGNAL beep_timer    : INTEGER RANGE 0 TO MAX_COUNT_1HZ := 0; -- Tempo restante do "bip" curto de cada segundo
    SIGNAL alarm_cnt     : INTEGER RANGE 0 TO MAX_COUNT_1HZ := 0; -- Divisor de frequência para o apito intermitente final
    SIGNAL alarm_toggle  : STD_LOGIC := '0';                      -- Alterna entre '0' e '1' para apitar freneticamente no final

    -- Sinais internos da interface visual do display
    SIGNAL current_bcd   : INTEGER RANGE 0 TO 9 := 0;         -- Dígito numérico enviado ao decodificador no milissegundo atual
    SIGNAL seg7          : STD_LOGIC_VECTOR(6 DOWNTO 0);      -- Código de 7 bits gerado pelo decodificador (G até A)
    SIGNAL dp            : STD_LOGIC := '1';                  -- Controle do Ponto Decimal ('0' acende, '1' apaga)

BEGIN

    -- =========================================================================================
    -- PROCESSO 1: Leitura de Botões (Debounce + Borda), Ajuste de Tempo, Contagem e Alarme
    -- =========================================================================================
    PROCESS (clk)
        -- Variável auxiliar para ajustar o tempo de debounce automaticamente entre placa real e simulação
        VARIABLE limit_deb : INTEGER;
    BEGIN
        -- Tudo acontece de forma síncrona na borda de subida do clock de 50 MHz
        IF rising_edge(clk) THEN
            
            -- Desloca os bits para sincronizar a leitura física dos 4 botões com o clock interno
            start_sync <= start_sync(0) & btn_start;
            secu_sync  <= secu_sync(0)  & btn_sec_u;
            secd_sync  <= secd_sync(0)  & btn_sec_d;
            minu_sync  <= minu_sync(0)  & btn_min_u;

            -- Se MAX_COUNT_1HZ for pequeno, estamos no ModelSim (tira o atraso do debounce). Senão, usa 20 ms reais.
            IF MAX_COUNT_1HZ < 1000 THEN
                limit_deb := 1;
            ELSE
                limit_deb := 1000000;
            END IF;

            -- Filtro Debounce para o botão Start: só atualiza 'start_stable' se o botão mantiver o valor até 'limit_deb'
            IF start_sync(1) /= start_stable THEN
                IF deb_cnt_start < limit_deb THEN
                    deb_cnt_start <= deb_cnt_start + 1;
                ELSE
                    start_stable  <= start_sync(1);
                    deb_cnt_start <= 0;
                END IF;
            ELSE
                deb_cnt_start <= 0;
            END IF;

            -- Filtro Debounce para o botão de Unidade de Segundo (KEY1)
            IF secu_sync(1) /= secu_stable THEN
                IF deb_cnt_secu < limit_deb THEN
                    deb_cnt_secu <= deb_cnt_secu + 1;
                ELSE
                    secu_stable  <= secu_sync(1);
                    deb_cnt_secu <= 0;
                END IF;
            ELSE
                deb_cnt_secu <= 0;
            END IF;

            -- Filtro Debounce para o botão de Dezena de Segundo (KEY2)
            IF secd_sync(1) /= secd_stable THEN
                IF deb_cnt_secd < limit_deb THEN
                    deb_cnt_secd <= deb_cnt_secd + 1;
                ELSE
                    secd_stable  <= secd_sync(1);
                    deb_cnt_secd <= 0;
                END IF;
            ELSE
                deb_cnt_secd <= 0;
            END IF;

            -- Filtro Debounce para o botão de Minuto (KEY3)
            IF minu_sync(1) /= minu_stable THEN
                IF deb_cnt_minu < limit_deb THEN
                    deb_cnt_minu <= deb_cnt_minu + 1;
                ELSE
                    minu_stable  <= minu_sync(1);
                    deb_cnt_minu <= 0;
                END IF;
            ELSE
                deb_cnt_minu <= 0;
            END IF;

            -- Salva o estado estável atual para comparar no próximo ciclo de clock (detector de borda)
            start_prev <= start_stable;
            secu_prev  <= secu_stable;
            secd_prev  <= secd_stable;
            minu_prev  <= minu_stable;

            -- Detecta se houve clique (borda de descida: era '1' solto e virou '0' pressionado) no botão Start
            IF (start_prev = '1' AND start_stable = '0') THEN
                IF alarm = '1' THEN
                    -- Se o alarme final estava tocando, o clique serve para calar o alarme
                    alarm <= '0';
                ELSIF (sec_uni > 0 OR sec_dez > 0 OR min_uni > 0) THEN
                    -- Se houver algum tempo configurado maior que zero, inverte entre rodando ('1') e pausado ('0')
                    running <= NOT running;
                END IF;
            END IF;

            -- MODO PAUSADO / CONFIGURAÇÃO (running = '0')
            IF running = '0' THEN
                count_1hz  <= 0; -- Mantém o divisor de 1 segundo zerado
                beep_timer <= 0; -- Garante que o bip de segundo esteja desligado

                -- Clique no botão de Unidade de Segundo: incrementa de 0 a 9
                IF (secu_prev = '1' AND secu_stable = '0') THEN
                    alarm <= '0'; -- Desliga o alarme caso estivesse ligado
                    IF sec_uni = 9 THEN
                        sec_uni <= 0;
                    ELSE
                        sec_uni <= sec_uni + 1;
                    END IF;
                END IF;

                -- Clique no botão de Dezena de Segundo: incrementa de 0 a 5
                IF (secd_prev = '1' AND secd_stable = '0') THEN
                    alarm <= '0';
                    IF sec_dez = 5 THEN
                        sec_dez <= 0;
                    ELSE
                        sec_dez <= sec_dez + 1;
                    END IF;
                END IF;

                -- Clique no botão de Minuto: incrementa de 0 a 9
                IF (minu_prev = '1' AND minu_stable = '0') THEN
                    alarm <= '0';
                    IF min_uni = 9 THEN
                        min_uni <= 0;
                    ELSE
                        min_uni <= min_uni + 1;
                    END IF;
                END IF;

            -- MODO CONTAGEM REGRESSIVA RODANDO (running = '1')
            ELSE
                -- Se o timer do bip curto de 1 segundo estiver ativo, vai decrementando até zerar (desligar o bip)
                IF beep_timer > 0 THEN
                    beep_timer <= beep_timer - 1;
                END IF;

                -- Verifica se completou 1 segundo inteiro (50 milhões de ciclos na placa)
                IF count_1hz >= MAX_COUNT_1HZ - 1 THEN
                    count_1hz <= 0; -- Reinicia o contador de 1 segundo

                    -- Caso de segurança: se já estava tudo em 0, para e aciona o alarme
                    IF sec_uni = 0 AND sec_dez = 0 AND min_uni = 0 THEN
                        running <= '0';
                        alarm   <= '1';
                    ELSE
                        -- Se faltava apenas 1 segundo (0:01), cai para 0:00, para a contagem e dispara o alarme contínuo!
                        IF (sec_uni = 1 AND sec_dez = 0 AND min_uni = 0) THEN
                            sec_uni <= 0;
                            running <= '0';
                            alarm   <= '1';
                        ELSE
                            -- Se ainda não zerou, recarrega o 'beep_timer' com 0,1 segundo (100 ms) para dar um apito curto
                            IF MAX_COUNT_1HZ >= 10 THEN
                                beep_timer <= MAX_COUNT_1HZ / 10;
                            ELSE
                                beep_timer <= 1;
                            END IF;

                            -- Lógica de empréstimo (borrow) da contagem regressiva
                            IF sec_uni = 0 THEN
                                sec_uni <= 9; -- Unidade volta para 9 e pede emprestado da dezena
                                IF sec_dez = 0 THEN
                                    sec_dez <= 5; -- Dezena volta para 5 e pede emprestado do minuto
                                    IF min_uni > 0 THEN
                                        min_uni <= min_uni - 1; -- Decrementa 1 minuto
                                    END IF;
                                ELSE
                                    sec_dez <= sec_dez - 1; -- Decrementa 1 dezena de segundo
                                END IF;
                            ELSE
                                sec_uni <= sec_uni - 1; -- Decrementa 1 unidade de segundo normalmente
                            END IF;
                        END IF;
                    END IF;
                ELSE
                    -- Enquanto não completa 1 segundo, soma +1 no ciclo de clock
                    count_1hz <= count_1hz + 1;
                END IF;
            END IF;

            -- GERADOR DE FREQUÊNCIA DO ALARME DISPARADO (Quando chega em 0.00)
            IF alarm = '1' THEN
                -- Inverte o estado do buzzer a cada 0,1 segundo (100 ms ligado, 100 ms desligado -> 5 apitos por segundo)
                IF alarm_cnt >= (MAX_COUNT_1HZ / 10) - 1 THEN
                    alarm_cnt    <= 0;
                    alarm_toggle <= NOT alarm_toggle;
                ELSE
                    alarm_cnt <= alarm_cnt + 1;
                END IF;
            ELSE
                alarm_cnt    <= 0;
                alarm_toggle <= '0';
            END IF;

        END IF;
    END PROCESS;

    -- =========================================================================================
    -- PROCESSO 2: Acionamento Físico do Buzzer (Lógica Combinacional Ativa em Baixa: '0' apita)
    -- =========================================================================================
    PROCESS (alarm, alarm_toggle, beep_timer)
    BEGIN
        IF alarm = '1' THEN
            buzzer <= alarm_toggle; -- Se o cronômetro zerou, manda a onda quadrada intermitente pro buzzer
        ELSIF beep_timer > 0 THEN
            buzzer <= '0';          -- Se acabou de descer 1 segundo, manda '0' para dar o bip curto de 100 ms
        ELSE
            buzzer <= '1';          -- Caso contrário, manda '1' para cortar o transistor e manter o buzzer em silêncio
        END IF;
    END PROCESS;

    -- =========================================================================================
    -- PROCESSO 3: Multiplexação Síncrona dos Displays de 7 Segmentos (Anti-Fantasma)
    -- =========================================================================================
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- Conta até 1 milissegundo (50.000 ciclos) para trocar qual display está aceso
            IF count_mux >= MAX_COUNT_MUX - 1 THEN
                count_mux <= 0;
                IF mux_sel = 2 THEN
                    mux_sel <= 0; -- Volta para o primeiro display
                ELSE
                    mux_sel <= mux_sel + 1; -- Passa para o próximo display
                END IF;
            ELSE
                count_mux <= count_mux + 1;
            END IF;

            -- Seleciona qual anodo ligar (colocando '0' apenas nele) e qual número enviar para as trilhas
            CASE mux_sel IS
                WHEN 0 =>
                    sel         <= "111110"; -- Liga apenas o display da direita (Unidade de Segundo)
                    current_bcd <= sec_uni;  -- Envia o valor da unidade de segundo
                    dp          <= '1';      -- Ponto decimal apagado
                WHEN 1 =>
                    sel         <= "111101"; -- Liga apenas o display do meio (Dezena de Segundo)
                    current_bcd <= sec_dez;  -- Envia o valor da dezena de segundo
                    dp          <= '1';      -- Ponto decimal apagado
                WHEN 2 =>
                    sel         <= "111011"; -- Liga apenas o display da esquerda (Minuto)
                    current_bcd <= min_uni;  -- Envia o valor do minuto
                    dp          <= '0';      -- Ponto decimal ACESO para separar Minuto.Segundo
                WHEN OTHERS =>
                    sel         <= "111111"; -- Desliga todos os 6 displays por segurança
                    current_bcd <= 0;
                    dp          <= '1';
            END CASE;
        END IF;
    END PROCESS;

    -- =========================================================================================
    -- PROCESSO 4: Decodificador BCD para 7 Segmentos (Anodo Comum: '0' acende, '1' apaga)
    -- Ordem dos bits no vetor seg7: (6=G, 5=F, 4=E, 3=D, 2=C, 1=B, 0=A)
    -- =========================================================================================
    PROCESS (current_bcd)
    BEGIN
        CASE current_bcd IS
            WHEN 0 => seg7 <= "1000000"; -- Desenha 0 (apaga só o meio G)
            WHEN 1 => seg7 <= "1111001"; -- Desenha 1 (acende só B e C)
            WHEN 2 => seg7 <= "0100100"; -- Desenha 2
            WHEN 3 => seg7 <= "0110000"; -- Desenha 3
            WHEN 4 => seg7 <= "0011001"; -- Desenha 4
            WHEN 5 => seg7 <= "0010010"; -- Desenha 5
            WHEN 6 => seg7 <= "0000010"; -- Desenha 6
            WHEN 7 => seg7 <= "1111000"; -- Desenha 7
            WHEN 8 => seg7 <= "0000000"; -- Desenha 8 (acende todos os 7 segmentos)
            WHEN 9 => seg7 <= "0010000"; -- Desenha 9
            WHEN OTHERS => seg7 <= "1111111"; -- Apaga tudo
        END CASE;
    END PROCESS;

    -- Concatena o bit do Ponto Decimal (DIG[7]) com os 7 bits dos segmentos numéricos (DIG[6:0])
    dig <= dp & seg7;

END behavior;