library ieee;
use ieee.STD_LOGIC_1164.all;

entity SubCircuit is
    port (
        A : in STD_LOGIC;
        B : out STD_LOGIC;
        C : in STD_LOGIC;
        Z : out STD_LOGIC
    );
end SubCircuit;

architecture RTL of SubCircuit is
begin
    Z <= (not (A and B)) or (not(a and (not c)));
end RTL; -- RTL

entity TopLevel is
    port (
        X1 : in STD_LOGIC;
        X2 : in STD_LOGIC;
        X3 : in STD_LOGIC;
        Z1 : out STD_LOGIC;
        Z2 : out STD_LOGIC
    );
end TopLevel;

architecture RTL of TopLevel is

    signal A : STD_LOGIC;
    signal B : STD_LOGIC;
    component SubCircuit
        port (
            A : in STD_LOGIC;
            B : out STD_LOGIC;
            C : in STD_LOGIC;
            Z : out STD_LOGIC
        );
    end component;
begin

    TL : SubCircuit
    port map(
        A => X1,
        B => X2,
        C => X2,
        Z => A
    )

    TR : SubCircuit
    port map(
        A => A,
        B => X1,
        C => B,
        Z => Z1
    )

    BL : SubCircuit
    port map(
        A => X1,
        B => X3,
        C => X2,
        Z => B
    )

    BR : SubCircuit
    port map(
        A => A,
        B => X1,
        C => B,
        Z => Z2
    )

end RTL; -- RTL