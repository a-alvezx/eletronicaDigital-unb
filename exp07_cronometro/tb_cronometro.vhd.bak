LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_cronometro IS
END tb_cronometro;

ARCHITECTURE behavior OF tb_cronometro IS

    COMPONENT cronometro
        GENERIC (
            MAX_COUNT_1HZ : INTEGER := 50000000;
            MAX_COUNT_MUX : INTEGER := 50000
        );
        PORT (
            clk        : IN  STD_LOGIC;
            reset_n    : IN  STD_LOGIC;
            start_stop : IN  STD_LOGIC;
            sel        : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            dig        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk        : STD_LOGIC := '0';
    SIGNAL reset_n    : STD_LOGIC := '1';
    SIGNAL start_stop : STD_LOGIC := '1';
    SIGNAL sel        : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL dig        : STD_LOGIC_VECTOR(7 DOWNTO 0);

    CONSTANT CLK_PERIOD : TIME := 20 ns;

BEGIN

    uut: cronometro
        GENERIC MAP (
            MAX_COUNT_1HZ => 4,
            MAX_COUNT_MUX => 1
        )
        PORT MAP (
            clk        => clk,
            reset_n    => reset_n,
            start_stop => start_stop,
            sel        => sel,
            dig        => dig
        );

    clk_process : PROCESS
    BEGIN
        WHILE now < 6000 ns LOOP
            clk <= '0';
            WAIT FOR CLK_PERIOD / 2;
            clk <= '1';
            WAIT FOR CLK_PERIOD / 2;
        END LOOP;
        WAIT;
    END PROCESS;

    stim_proc: PROCESS
    BEGIN
        reset_n <= '0';
        WAIT FOR 40 ns;
        reset_n <= '1';
        WAIT FOR 40 ns;

        start_stop <= '0';
        WAIT FOR 40 ns;
        start_stop <= '1';

        WAIT FOR 5200 ns;

        start_stop <= '0';
        WAIT FOR 40 ns;
        start_stop <= '1';

        WAIT FOR 300 ns;

        reset_n <= '0';
        WAIT FOR 60 ns;
        reset_n <= '1';

        WAIT;
    END PROCESS;

END behavior;