library ieee;
use ieee.std_logic_1164.all;

entity reg_test is
   port (
      readA      : out std_logic_vector(31 downto 0);
      readB      : out std_logic_vector(31 downto 0)
    );
end reg_test;

architecture structural of reg_test is
component reg_file is
    port (
    Ra      : in std_logic_vector(4 downto 0);
    Rb      : in std_logic_vector(4 downto 0);
    Rw      : in std_logic_vector(4 downto 0);
    busW   : in std_logic_vector(31 downto 0);
    RegWr   : in std_logic;
    clk     : in std_logic;
    busA   : out std_logic_vector(31 downto 0);
    busB   : out std_logic_vector(31 downto 0)
    );
end component;

   signal Ra0      :  std_logic_vector(4 downto 0);
   signal Rb0      :  std_logic_vector(4 downto 0);
   signal Rw0      :  std_logic_vector(4 downto 0);
   signal busW0    :  std_logic_vector(31 downto 0);
   signal RegWr0   :  std_logic;
   signal clk0     :  std_logic;

begin
    reg_map : reg_file port map(Ra => Ra0, Rb => Rb0, Rw => Rw0, busW => busW0, RegWr => RegWr0, clk => clk0, BusA => readA, BusB => readB);
    
    test_proc : process
    begin
	Ra0 <= "00001";
	Rb0 <= "00001";
        Rw0 <= "00001";
	busW0 <= "10101010101010101010101010101010";
	RegWr0 <= '1';
	clk0 <= '0';
        wait for 5 ns;
	clk0 <= '1';
        wait for 5 ns;
	busW0 <= "11111111111111111111111111111111";
	clk0 <= '0';
        wait for 5 ns;
	clk0 <= '1';
        wait for 5 ns;
	Ra0 <= "00001";
	Rb0 <= "00010";
        Rw0 <= "00010";
	busW0 <= "11111010111110101010101110101010";
	clk0 <= '0';
        wait for 5 ns;
	clk0 <= '1';
        wait for 5 ns;
        wait;
    end process;
end architecture structural;