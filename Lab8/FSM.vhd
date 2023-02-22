library ieee;
use ieee.std_logic_1164.all;
entity FSM is
    port (
        Clock, Resetn, w : in STD_LOGIC;
        z                : out STD_LOGIC
    );
end FSM;
architecture Behavior of FSM is
    type State_type is (A, B, C);
    signal y : State_type;
begin
    process (Resetn, Clock)
    begin
        if Resetn = '0' then
            y <= A;
        elsif (Clock'EVENT and Clock = '1') then
            case y is
                when A =>
                    if w = '0' then
                        y <= A;
                    else
                        y <= B;
                    end if;
                when B =>
                    if w = '0' then
                        y <= A;
                    else
                        y <= C;
                    end if;
                when C =>
                    if w = '0' then
                        y <= A;
                    else
                        y <= C;
                    end if;
            end case;
        end if;
    end process;
    z <= '1' when y = C else
        '0';
end Behavior;