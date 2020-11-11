library ieee;
use ieee.std_logic_1164.all;

entity extender_test is
   port (
      z      : out std_logic_vector(31 downto 0)
    );
end extender_test;

architecture structural of extender_test is
    component extender is
        port (
            x      : in std_logic_vector(15 downto 0);
            z      : out std_logic_vector(31 downto 0)
        );
end component extender;

signal xin : std_logic_vector(15 downto 0);
begin
    extender_map : extender port map (x => xin, z => z);
    
    test_proc : process
    begin
        xin <= "1111111111111111";
        wait for 5 ns;
        xin <= "0000000000000000";
        wait for 5 ns;
        xin <= "1000000000000000";
        wait for 5 ns;
        xin <= "0000000000000001";
        wait for 5 ns;
        xin <= "1011101011010110";
        wait for 5 ns;
        xin <= "0010111111111111";
        wait for 5 ns;
        wait;
    end process;
end architecture structural;