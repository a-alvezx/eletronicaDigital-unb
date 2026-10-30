library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_circuito_risco is
end tb_circuito_risco;

architecture sim of tb_circuito_risco is
    signal A, B, C, D : std_logic := '0';
    signal NORMAL, ALERTA, CRITICO : std_logic;

    -- índice = 8A + 4B + 2C + D
    constant EXP_N : std_logic_vector(0 to 15) := "1110100010000000";
    constant EXP_A : std_logic_vector(0 to 15) := "0001011001101000";
    constant EXP_C : std_logic_vector(0 to 15) := "0000000100010111";
begin
    uut: entity work.proj1_252003794
        port map (A => A, B => B, C => C, D => D,
                  NORMAL => NORMAL, ALERTA => ALERTA, CRITICO => CRITICO);

    stim: process
        variable v : unsigned(3 downto 0);
    begin
        for i in 0 to 15 loop
            v := to_unsigned(i, 4);
            A <= v(3); B <= v(2); C <= v(1); D <= v(0);
            wait for 10 ns;

            assert NORMAL  = EXP_N(i) report "NORMAL errado em "  & integer'image(i) severity error;
            assert ALERTA  = EXP_A(i) report "ALERTA errado em "  & integer'image(i) severity error;
            assert CRITICO = EXP_C(i) report "CRITICO errado em " & integer'image(i) severity error;

            -- exatamente uma saída ativa
            assert ((NORMAL = '1') xor (ALERTA = '1') xor (CRITICO = '1'))
                   and not (NORMAL = '1' and ALERTA = '1' and CRITICO = '1')
                report "Mais de uma saida (ou nenhuma) ativa em " & integer'image(i)
                severity error;
        end loop;
        report "Simulacao concluida." severity note;
        wait;
    end process;
end sim;