library ieee;
use ieee.std_logic_1164.all ;

entity Switches_to_LEDs is 
port(
    i1 : in std_logic;
    i2 : in std_logic;
    i2 : in std_logic;
    o1 : out std_logic;
    o2 : out std_logic;
    o3 : out std_logic;
    );
end entity Switches_to_LEDs;

architecture RTL of Switches_to_LEDS is
    begin
        o1 <= i1;
        o2 <= i2;
        o3 <= i3;
end architecture RTL;