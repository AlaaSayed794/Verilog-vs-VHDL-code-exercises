library ieee;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;


entity Debounce_Switch is
    port(
    clk : in std_logic;
    input1 : in std_logic;
    output1 : out std_logic;
    );
end entity Debounce_Switch;

architecture RTL of Debounce_Switch is
    constant c_DEBOUNCE_LIMIT:integer :=250000; --10 ms at 25MHz
    signal r_state : std_logic := '0';
    signal r_count : integer range 0 to c_DEBOUNCE_LIMIT := 0;

begin
    p_debounce: process(clk) is
    begin
        if rising_edge(clk) then
            if (input1 /= r_state and r_count < c_DEBOUNCE_LIMIT) then
                r_count <= r_count+1;
            elsif r_count = c_DEBOUNCE_LIMIT then
                r_state <= input1;
                r_count <= 0 ;
            else
                r_count <= 0;
            end if ;
            
        end if ;

    end process p_debounce

    output1<= r_state;

end architecture RTL;