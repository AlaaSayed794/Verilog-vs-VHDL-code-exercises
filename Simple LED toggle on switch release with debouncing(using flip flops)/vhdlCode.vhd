library ieee;
use ieee.std_logic_1164.all ;

entity On_Release_LED is 
port(
    clk : in std_logic;
    i1 : in std_logic;
    o1 : out std_logic;
    );
end entity On_Release_LED;

architecture RTL of On_Release_LED is
    signal r_switch : std_logic := '0';
    signal r_led : std_logic := '0';
    signal w_switch1 : std_logic;

    begin
        -- instantiate the debounce module
        Debounce_Inst : entity work.Debounce_Switch
        port map (
            clk <= clk,
            input1 <= i1,
            output1 <=w_switch1
        );

        p_register : process(clk) is
        begin
            if rising_edge(clk) then
                r_switch <= w_switch1;
                if w_switch1='0' and r_switch='1'  then
                    r_led <= not r_led; 
                end if ;
            end if ;
        end process p_register;
    
    o1 <= r_led;

end architecture RTL;