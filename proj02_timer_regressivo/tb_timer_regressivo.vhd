-- Importa as bibliotecas padrão do IEEE
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- Entidade do Testbench é sempre vazia (não tem pinos físicos de entrada/saída)
ENTITY tb_timer_regressivo IS
END tb_timer_regressivo;

ARCHITECTURE behavior OF tb_timer_regressivo IS

    -- Declara o componente do nosso Timer Regressivo que será testado
    COMPONENT timer_regressivo
        GENERIC (
            MAX_COUNT_1HZ : INTEGER := 50000000;
            MAX_COUNT_MUX : INTEGER := 50000
        );
        PORT (
            clk       : IN  STD_LOGIC;
            btn_start : IN  STD_LOGIC;
            btn_sec_u : IN  STD_LOGIC;
            btn_sec_d : IN  STD_LOGIC;
            btn_min_u : IN  STD_LOGIC;
            buzzer    : OUT STD_LOGIC;
            sel       : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
            dig       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    -- Sinais virtuais para conectar nos pinos do componente (botões iniciam em '1' = soltos)
    SIGNAL clk       : STD_LOGIC := '0';
    SIGNAL btn_start : STD_LOGIC := '1';
    SIGNAL btn_sec_u : STD_LOGIC := '1';
    SIGNAL btn_sec_d : STD_LOGIC := '1';
    SIGNAL btn_min_u : STD_LOGIC := '1';
    SIGNAL buzzer    : STD_LOGIC;
    SIGNAL sel       : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL dig       : STD_LOGIC_VECTOR(7 DOWNTO 0);

    -- Define o período do clock de 50 MHz (1 / 50MHz = 20 nanosegundos)
    CONSTANT CLK_PERIOD : TIME := 20 ns;

BEGIN

    -- Instancia o circuito (Unit Under Test) reduzindo o divisor de 1 segundo para apenas 10 ciclos (200 ns)
    uut: timer_regressivo
        GENERIC MAP (
            MAX_COUNT_1HZ => 10, -- 10 ciclos de clock = 1 "segundo" na simulação (permite ver o bip de 1 ciclo)
            MAX_COUNT_MUX => 1   -- Troca o display ativo a cada ciclo de clock
        )
        PORT MAP (
            clk       => clk,
            btn_start => btn_start,
            btn_sec_u => btn_sec_u,
            btn_sec_d => btn_sec_d,
            btn_min_u => btn_min_u,
            buzzer    => buzzer,
            sel       => sel,
            dig       => dig
        );

    -- Processo gerador de clock contínuo até 4500 nanosegundos de simulação
    clk_process : PROCESS
    BEGIN
        WHILE now < 4500 ns LOOP
            clk <= '0';
            WAIT FOR CLK_PERIOD / 2; -- Fica 10 ns em nível baixo
            clk <= '1';
            WAIT FOR CLK_PERIOD / 2; -- Fica 10 ns em nível alto
        END LOOP;
        WAIT; -- Para o clock ao final dos 4500 ns
    END PROCESS;

    -- Processo que simula o dedo do usuário configurando "0.12" e iniciando a contagem
    stim_proc: PROCESS
    BEGIN
        -- Aguarda 60 ns iniciais para estabilização
        WAIT FOR 60 ns;

        -- 1. Aperta KEY2 (Dezena de segundo) uma vez -> Configura "0.10"
        btn_sec_d <= '0';
        WAIT FOR 60 ns;
        btn_sec_d <= '1';
        WAIT FOR 60 ns;

        -- 2. Aperta KEY1 (Unidade de segundo) a primeira vez -> Configura "0.11"
        btn_sec_u <= '0';
        WAIT FOR 60 ns;
        btn_sec_u <= '1';
        WAIT FOR 60 ns;

        -- 3. Aperta KEY1 (Unidade de segundo) a segunda vez -> Configura "0.12"
        btn_sec_u <= '0';
        WAIT FOR 60 ns;
        btn_sec_u <= '1';
        WAIT FOR 60 ns;

        -- 4. Aperta o botão Start -> Inicia a contagem regressiva de 0.12 até 0.00
        btn_start <= '0';
        WAIT FOR 60 ns;
        btn_start <= '1';

        -- 5. Espera 3000 ns (12 segundos simulados levam 2400 ns; nos 600 ns restantes o alarme fica apitando em 0.00)
        WAIT FOR 3000 ns;

        -- 6. Aperta o botão Start novamente para desligar o alarme final
        btn_start <= '0';
        WAIT FOR 60 ns;
        btn_start <= '1';

        -- Encerra os estímulos
        WAIT;
    END PROCESS;

END behavior;