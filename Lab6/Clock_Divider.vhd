library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_LATCH is
    port (
        CLK : in STD_LOGIC;
        D   : in STD_LOGIC;
        Q   : out STD_LOGIC;
        Qn  : out STD_LOGIC
    );
end D_LATCH;

architecture RTL of D_LATCH is
begin
    process (CLK)
    begin
        if (rising_edge(CLK)) then
            Q  <= D;
            Qn <= not D;
        end if;
    end process;

end RTL;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity clock_divider is
    generic (
        stages : INTEGER := 16
    );
    port (
        CLK_IN  : in STD_LOGIC;
        CLK_OUT : out STD_LOGIC
    );
end clock_divider;

architecture RTL of clock_divider is

    signal Q  : STD_LOGIC_VECTOR(stages downto 0);
    signal Qn : STD_LOGIC_VECTOR(stages downto 0);
    component D_LATCH
        port (
            CLK : in STD_LOGIC;
            D   : in STD_LOGIC;
            Q   : out STD_LOGIC;
            Qn  : out STD_LOGIC
        );
    end component;
begin
    Q(0)    <= CLK_IN;
    CLK_OUT <= Qn(stages - 1);

    gen : for i in 0 to stages - 1 generate
        L : D_LATCH
        port map(
            CLK => Q(i),
            Qn  => Qn(i),
            D   => Qn(i),
            Q   => Q(i + 1)

        );
    end generate;

end RTL; -- RTL