 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity proj1_252003794 is
    Port ( A, B, C, D : in  STD_LOGIC;
           NORMAL     : out STD_LOGIC;
           ALERTA     : out STD_LOGIC;
           CRITICO    : out STD_LOGIC );
end proj1_252003794;

architecture Behavioral of proj1_252003794 is
begin
    NORMAL  <= ((not A) and (not B) and (not C)) or
               ((not A) and (not B) and (not D)) or
               ((not A) and (not C) and (not D)) or
               ((not B) and (not C) and (not D));

    ALERTA  <= ((not A) and (not B) and C and D) or
               ((not A) and B and (not C) and D) or
               ((not A) and B and C and (not D)) or
               (A and (not B) and (not C) and D) or
               (A and (not B) and C and (not D)) or
               (A and B and (not C) and (not D));

    CRITICO <= (A and B and C) or (A and B and D) or
               (A and C and D) or (B and C and D);
end Behavioral;