library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity full_adder_32bit_tb is
  port (
    z     : out std_logic_vector(31 downto 0);
    cout  : out std_logic;
    ovf  : out std_logic
  );
end full_adder_32bit_tb;
architecture structural of full_adder_32bit_tb is
component full_adder_32bit is
  port (
    x     : in std_logic_vector(31 downto 0);
    y     : in std_logic_vector(31 downto 0);
    cin   : in std_logic;
    z     : out std_logic_vector(31 downto 0);
    cout  : out std_logic;
    ovf  : out std_logic
  );
end component full_adder_32bit;

signal x_sig, y_sig : std_logic_vector(31 downto 0);
signal cin_sig : std_logic;

begin
	full_adder_map : full_adder_32bit port map(x_sig, y_sig, cin_sig, z, cout, ovf);
	test_proc : process
	begin
		x_sig <= "10101010101010101010101010101010";
		y_sig <= "01010101010101010101010101010101";
		cin_sig <= '0';
		wait for 5 ns;
		x_sig <= "10101010101010101010101010101011";
		wait for 5 ns;
		x_sig <= "00000000000000000000000000000010";
		y_sig <= "00000000000000000000000000000001";
		cin_sig <= '1';
		wait for 5 ns;
		x_sig <= "00000000000000000000000000000001";
		wait for 5 ns;
		wait;
	end process;
end architecture structural;