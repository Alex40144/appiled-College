library ieee;
use ieee.std_logic_1164.all;

entity FourBitAdder is
  port (
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    S : out std_logic_vector(3 downto 0);
    Cin : in std_logic;
    Cout : out std_logic
  );
end FourBitAdder;

architecture RTL of FourBitAdder is
    component fullAdder is
        port (
            A    : in STD_LOGIC;
            B    : in STD_LOGIC;
            Cin  : in STD_LOGIC;
            Cout : out STD_LOGIC;
            Sum  : out STD_LOGIC
        );
    end component;

    signal C : std_logic_vector(4 downto 0);

begin
    C(0) <= Cin;
    Cout <= C(4);
    gen: for i in 0 to 3 generate
        Adder : fullAdder
        port map (
            A => A(i),
            B => B(i),
            Sum => S(i),
            Cin => C(i),
            Cout => C(i + 1)
        );
    end generate;

end RTL ; -- RTL