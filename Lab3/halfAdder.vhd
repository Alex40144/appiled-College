------------------------------------
--
-- Half Adder
--
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity halfAdder is
    port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        C : out STD_LOGIC;
        S : out STD_LOGIC
    );
end entity;

architecture RTL of halfAdder is
begin
    C <= A and B;
    S <= A xor B;

end architecture;
