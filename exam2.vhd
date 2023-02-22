library ieee;
use ieee.std_logic_1164.all;
entity FSM is
    port (
        Clock : in STD_LOGIC;
        Reset : in STD_LOGIC;
        D     : in STD_LOGIC;
        Z1    : out STD_LOGIC;
        Z2    : out STD_LOGIC
    );
end FSM;
architecture RTL of FSM is
    type State_type is (A, B, C, F);
    signal STATE : State_type;
begin
    process (Reset, Clock)
    begin
        if Reset = '1' then
            STATE <= A;
        elsif rising_edge(Clock) then
            case STATE is
                when A =>
                    Z1 <= '0';
                    Z2 <= '0';
                    if D = '1' then
                        STATE <= B;
                    else
                        STATE <= F;
                    end if;
                when B =>
                    Z1 <= '1';
                    Z2 <= '0';
                    if D = '1' then
                        STATE <= C;
                    else
                        STATE <= A;
                    end if;
                when C =>
                    Z1 <= '0';
                    Z2 <= '1';
                    if D = '1' then
                        STATE <= F;
                    else
                        STATE <= B;
                    end if;
                when F =>
                    Z1 <= '1';
                    Z2 <= '1';
                    if D = '1' then
                        STATE <= A;
                    else
                        STATE <= C;
                    end if;
            end case;
        end if;
    end process;
end RTL;