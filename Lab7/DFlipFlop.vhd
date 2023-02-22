library ieee;
use ieee.STD_LOGIC_1164.all;

entity DFlipFlop is
    port (
        clock : in STD_LOGIC;
        D     : in STD_LOGIC;
        Q     : out STD_LOGIC;
        PRN   : in STD_LOGIC;
        CLRN  : in STD_LOGIC
    );
end DFlipFlop;

architecture RTL of DFlipFlop is
begin
    process (clock, PRN, CLRN)
    begin
        if (rising_edge(clock)) then
            Q <= D;
        end if;
        if (PRN = '0') then
            Q <= '1';
        end if;
        if (CLRN = '0') then
            Q <= '0';
        end if;
    end process;

end RTL; -- RTL