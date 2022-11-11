library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is
    port (
        A    : in STD_LOGIC;
        B    : in STD_LOGIC;
        Cin  : in STD_LOGIC;
        Cout : out STD_LOGIC;
        Sum  : out STD_LOGIC
    );
end fullAdder;

architecture RTL of fullAdder is

    component halfAdder is
        port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            C : out STD_LOGIC;
            S : out STD_LOGIC
        );
    end component halfAdder;

    signal C1_OUT : STD_LOGIC;
    signal C2_OUT : STD_LOGIC;
    signal Mid    : STD_LOGIC;

begin

    Cout <= C1_OUT or C2_OUT;

    half1 : halfAdder
    port map(
        A => A,
        B => B,
        C => C1_OUT,
        S => Mid

    );

    half2 : halfAdder
    port map(
        A => Mid,
        B => Cin,
        C => C2_OUT,
        S => Sum
    );

end architecture;