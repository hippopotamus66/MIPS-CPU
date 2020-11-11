library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity reg_file is
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
end reg_file;

architecture structural of reg_file is
    signal outputs : std_logic_vector(31 downto 0);
    signal dec_res : std_logic_vector(31 downto 0);
    
    component reg_file_bitslice is
    port (
    Ra      : in std_logic_vector(4 downto 0);
    Rb      : in std_logic_vector(4 downto 0);
    Rw      : in std_logic_vector(4 downto 0);
    busWi   : in std_logic;
    RegWr   : in std_logic;
    clk     : in std_logic;
    busAi   : out std_logic;
    busBi   : out std_logic
    );
    end component;

begin

    reg_map0 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(0), RegWr => RegWr, clk => clk, busAi => busA(0), busBi => busB(0));
    reg_map1 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(1), RegWr => RegWr, clk => clk, busAi => busA(1), busBi => busB(1));
    reg_map2 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(2), RegWr => RegWr, clk => clk, busAi => busA(2), busBi => busB(2));
    reg_map3 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(3), RegWr => RegWr, clk => clk, busAi => busA(3), busBi => busB(3));
    reg_map4 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(4), RegWr => RegWr, clk => clk, busAi => busA(4), busBi => busB(4));   
    reg_map5 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(5), RegWr => RegWr, clk => clk, busAi => busA(5), busBi => busB(5));
    reg_map6 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(6), RegWr => RegWr, clk => clk, busAi => busA(6), busBi => busB(6));
    reg_map7 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(7), RegWr => RegWr, clk => clk, busAi => busA(7), busBi => busB(7));
    reg_map8 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(8), RegWr => RegWr, clk => clk, busAi => busA(8), busBi => busB(8));
    reg_map9 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(9), RegWr => RegWr, clk => clk, busAi => busA(9), busBi => busB(9));
    reg_map10 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(10), RegWr => RegWr, clk => clk, busAi => busA(10), busBi => busB(10));
    reg_map11 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(11), RegWr => RegWr, clk => clk, busAi => busA(11), busBi => busB(11));
    reg_map12 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(12), RegWr => RegWr, clk => clk, busAi => busA(12), busBi => busB(12));   
    reg_map13 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(13), RegWr => RegWr, clk => clk, busAi => busA(13), busBi => busB(13));
    reg_map14 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(14), RegWr => RegWr, clk => clk, busAi => busA(14), busBi => busB(14));
    reg_map15 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(15), RegWr => RegWr, clk => clk, busAi => busA(15), busBi => busB(15));
    reg_map16 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(16), RegWr => RegWr, clk => clk, busAi => busA(16), busBi => busB(16));
    reg_map17 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(17), RegWr => RegWr, clk => clk, busAi => busA(17), busBi => busB(17));
    reg_map18 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(18), RegWr => RegWr, clk => clk, busAi => busA(18), busBi => busB(18));
    reg_map19 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(19), RegWr => RegWr, clk => clk, busAi => busA(19), busBi => busB(19));
    reg_map20 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(20), RegWr => RegWr, clk => clk, busAi => busA(20), busBi => busB(20));   
    reg_map21 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(21), RegWr => RegWr, clk => clk, busAi => busA(21), busBi => busB(21));
    reg_map22 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(22), RegWr => RegWr, clk => clk, busAi => busA(22), busBi => busB(22));
    reg_map23 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(23), RegWr => RegWr, clk => clk, busAi => busA(23), busBi => busB(23));
    reg_map24 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(24), RegWr => RegWr, clk => clk, busAi => busA(24), busBi => busB(24));
    reg_map25 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(25), RegWr => RegWr, clk => clk, busAi => busA(25), busBi => busB(25));
    reg_map26 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(26), RegWr => RegWr, clk => clk, busAi => busA(26), busBi => busB(26));
    reg_map27 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(27), RegWr => RegWr, clk => clk, busAi => busA(27), busBi => busB(27));
    reg_map28 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(28), RegWr => RegWr, clk => clk, busAi => busA(28), busBi => busB(28));   
    reg_map29 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(29), RegWr => RegWr, clk => clk, busAi => busA(29), busBi => busB(29));
    reg_map30 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(30), RegWr => RegWr, clk => clk, busAi => busA(30), busBi => busB(30));
    reg_map31 : reg_file_bitslice port map (Ra => Ra, Rb => Rb, Rw => Rw, busWi => busW(31), RegWr => RegWr, clk => clk, busAi => busA(31), busBi => busB(31));

end architecture structural;