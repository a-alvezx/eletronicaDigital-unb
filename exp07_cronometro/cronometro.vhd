LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY cronometro IS
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
END cronometro;

ARCHITECTURE behavior OF cronometro IS

    SIGNAL running        : STD_LOGIC := '0';
    SIGNAL key1_sync      : STD_LOGIC_VECTOR(1 DOWNTO 0) := "11";
    SIGNAL debounce_cnt   : INTEGER RANGE 0 TO 1000000 := 0;
    SIGNAL key1_stable    : STD_LOGIC := '1';
    SIGNAL key1_prev      : STD_LOGIC := '1';

    SIGNAL count_1hz      : INTEGER RANGE 0 TO MAX_COUNT_1HZ := 0;
    SIGNAL count_mux      : INTEGER RANGE 0 TO MAX_COUNT_MUX := 0;
    SIGNAL mux_sel        : INTEGER RANGE 0 TO 2 := 0;

    SIGNAL sec_uni        : INTEGER RANGE 0 TO 9 := 0;
    SIGNAL sec_dez        : INTEGER RANGE 0 TO 5 := 0;
    SIGNAL min_uni        : INTEGER RANGE 0 TO 9 := 0;

    SIGNAL current_bcd    : INTEGER RANGE 0 TO 9 := 0;
    SIGNAL seg7           : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL dp             : STD_LOGIC := '1';

BEGIN

    PROCESS (clk, reset_n)
    BEGIN
        IF reset_n = '0' THEN
            running      <= '0';
            key1_sync    <= "11";
            key1_stable  <= '1';
            key1_prev    <= '1';
            debounce_cnt <= 0;
        ELSIF rising_edge(clk) THEN
            key1_sync <= key1_sync(0) & start_stop;

            IF MAX_COUNT_1HZ < 1000 THEN
                key1_stable <= key1_sync(1);
            ELSE
                IF key1_sync(1) /= key1_stable THEN
                    IF debounce_cnt < 1000000 THEN
                        debounce_cnt <= debounce_cnt + 1;
                    ELSE
                        key1_stable  <= key1_sync(1);
                        debounce_cnt <= 0;
                    END IF;
                ELSE
                    debounce_cnt <= 0;
                END IF;
            END IF;

            key1_prev <= key1_stable;

            IF (key1_prev = '1' AND key1_stable = '0') THEN
                running <= NOT running;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (clk, reset_n)
    BEGIN
        IF reset_n = '0' THEN
            count_1hz <= 0;
            sec_uni   <= 0;
            sec_dez   <= 0;
            min_uni   <= 0;
        ELSIF rising_edge(clk) THEN
            IF running = '1' THEN
                IF count_1hz >= MAX_COUNT_1HZ - 1 THEN
                    count_1hz <= 0;
                    IF sec_uni = 9 THEN
                        sec_uni <= 0;
                        IF sec_dez = 5 THEN
                            sec_dez <= 0;
                            IF min_uni = 9 THEN
                                min_uni <= 0;
                            ELSE
                                min_uni <= min_uni + 1;
                            END IF;
                        ELSE
                            sec_dez <= sec_dez + 1;
                        END IF;
                    ELSE
                        sec_uni <= sec_uni + 1;
                    END IF;
                ELSE
                    count_1hz <= count_1hz + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (clk, reset_n)
    BEGIN
        IF reset_n = '0' THEN
            count_mux <= 0;
            mux_sel   <= 0;
        ELSIF rising_edge(clk) THEN
            IF count_mux >= MAX_COUNT_MUX - 1 THEN
                count_mux <= 0;
                IF mux_sel = 2 THEN
                    mux_sel <= 0;
                ELSE
                    mux_sel <= mux_sel + 1;
                END IF;
            ELSE
                count_mux <= count_mux + 1;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (mux_sel, sec_uni, sec_dez, min_uni)
    BEGIN
        CASE mux_sel IS
            WHEN 0 =>
                sel         <= "110";
                current_bcd <= sec_uni;
                dp          <= '1';
            WHEN 1 =>
                sel         <= "101";
                current_bcd <= sec_dez;
                dp          <= '1';
            WHEN 2 =>
                sel         <= "011";
                current_bcd <= min_uni;
                dp          <= '0';
            WHEN OTHERS =>
                sel         <= "111";
                current_bcd <= 0;
                dp          <= '1';
        END CASE;
    END PROCESS;

    PROCESS (current_bcd)
    BEGIN
        CASE current_bcd IS
            WHEN 0 => seg7 <= "1000000";
            WHEN 1 => seg7 <= "1111001";
            WHEN 2 => seg7 <= "0100100";
            WHEN 3 => seg7 <= "0110000";
            WHEN 4 => seg7 <= "0011001";
            WHEN 5 => seg7 <= "0010010";
            WHEN 6 => seg7 <= "0000010";
            WHEN 7 => seg7 <= "1111000";
            WHEN 8 => seg7 <= "0000000";
            WHEN 9 => seg7 <= "0010000";
            WHEN OTHERS => seg7 <= "1111111";
        END CASE;
    END PROCESS;

    dig <= dp & seg7;

END behavior;