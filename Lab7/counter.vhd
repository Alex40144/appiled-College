library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter is
    port (
        clock : in STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(4 downto 0)
    );
end Counter;

architecture RTL of Counter is
begin
    process (clock)
        variable count : unsigned (4 downto 0);
    begin
        if (rising_edge(clock)) then
            if count < 9 then
                count := count + 1;
            else
                count := "00000";
            end if;
        end if;
        Q <= STD_LOGIC_VECTOR(count);
    end process;

end RTL; -- RTL