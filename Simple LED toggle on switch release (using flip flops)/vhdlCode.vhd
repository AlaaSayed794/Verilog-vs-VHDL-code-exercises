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
    begin
       p_register : process(clk) is
        begin
            if rising_edge(clk) then
                r_switch <= i1;
                if i1='0' and r_switch='1'  then
                    r_led <= not r_led; 
                end if ;
            end if ;
        end process p_register;
    
    o1 <= r_led;

end architecture RTL;