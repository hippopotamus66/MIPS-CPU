library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity ALU_tb is
  port (
	cout : out std_logic; -- '1' for carry out
	ovf : out std_logic; -- '1' for overflow
	ze : out std_logic; -- '1' is zero
	R  : out  std_logic_vector(31 downto 0)
  );
end ALU_tb;
architecture structural of ALU_tb is
component ALU is
	port (
		ctrl   : in  std_logic_vector(2 downto 0);
		A  : in  std_logic_vector(31 downto 0);
		B  : in  std_logic_vector(31 downto 0);
		shamt: in  std_logic_vector(4 downto 0);
		cout : out std_logic; -- '1' for carry out
		ovf : out std_logic; -- '1' for overflow
		ze : out std_logic; -- '1' is zero
		R  : out  std_logic_vector(31 downto 0)
	);
end component ALU;
signal ctrl_sig		: std_logic_vector(2 downto 0) := "010";
signal A_sig, B_sig	: std_logic_vector(31 downto 0);
signal shamt_sig	: std_logic_vector(4 downto 0) := (others => '0');

begin
	ALU_map	: ALU port map (ctrl_sig, A_sig, B_sig, shamt_sig, cout, ovf, ze, R);
	
	test_proc : process
	begin
		A_sig <= "10101010101010101010101010101010";
		B_sig <= "01010101010101010101010101010101";
		ctrl_sig <= "000"; -- AND, all 0
		wait for 5 ns;
		ctrl_sig <= "001"; -- OR, all 1
		wait for 5 ns;
		A_sig <= "01010101010101010101010101010101";
		B_sig <= "10101010101010101010101010101011";
		ctrl_sig <= "010"; -- FA, all 0
		wait for 10 ns;
		A_sig <= "01010101010101010101010101010101";
		B_sig <= "00101010101010101010101010101011";
		ctrl_sig <= "100"; -- FA_U, 100...000
		wait for 5 ns;
		B_sig <= "10101010101010101010101010101010";
		ctrl_sig <= "011"; -- SLT, false
		wait for 5 ns;
		ctrl_sig <= "111"; -- SLT_U, true
		wait for 5 ns;
		shamt_sig <= "10000";
		ctrl_sig <= "101"; -- SLL
		wait for 5 ns;
		A_sig <= "00000000000000000000000000000010";
		B_sig <= "00000000000000000000000000000001";
		shamt_sig <= "00000";
		ctrl_sig <= "110"; -- SUB
		wait for 5 ns;
		wait;
	end process;
end architecture structural;
