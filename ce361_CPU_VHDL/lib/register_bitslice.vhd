library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity register_bitslice is
    port (
    busWi   : in std_logic;
    Rw_dec  : in std_logic_vector(31 downto 0);
    RegWr   : in std_logic;
    clk     : in std_logic;
    outputs : out std_logic_vector(31 downto 0)
    );
end register_bitslice;

architecture structural of register_bitslice is
	signal s32_0 : std_logic_vector(31 downto 0) :="00000000000000000000000000000000";
        signal s32_1 : std_logic_vector(31 downto 0) :="11111111111111111111111111111111";
	signal res : std_logic_vector(31 downto 0);
	signal res1 : std_logic_vector(31 downto 0);    
begin
    mux_map : mux_32 port map (sel => regWr, src0 => s32_0, src1 => s32_1, z => res);
    and_map  : and_gate_32 port map (x => res, y => Rw_dec, z => res1);
    --dffr_map : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(0), q => outputs(0));
    outputs(0) <= '0';
    dffr_map1 : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(1), q => outputs(1));
    dffr_map2 : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(2), q => outputs(2));
    dffr_map3 : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(3), q => outputs(3));
    dffr_map4 : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(4), q => outputs(4));
    dffr_map5 : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(5), q => outputs(5));
    dffr_map6 : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(6), q => outputs(6));
    dffr_map7 : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(7), q => outputs(7));
    dffr_map8 : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(8), q => outputs(8));
    dffr_map9 : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(9), q => outputs(9));
    dffr_map0 : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(10), q => outputs(10));
    dffr_mapq : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(11), q => outputs(11));
    dffr_mapw : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(12), q => outputs(12));
    dffr_mape : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(13), q => outputs(13));
    dffr_mapr : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(14), q => outputs(14));
    dffr_mapt : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(15), q => outputs(15));
    dffr_mapy : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(16), q => outputs(16));
    dffr_mapu : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(17), q => outputs(17));
    dffr_mapi : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(18), q => outputs(18));
    dffr_mapo : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(19), q => outputs(19));
    dffr_mapp : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(20), q => outputs(20));
    dffr_mapa : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(21), q => outputs(21));
    dffr_maps : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(22), q => outputs(22));
    dffr_mapd : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(23), q => outputs(23));
    dffr_mapf : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(24), q => outputs(24));
    dffr_mapg : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(25), q => outputs(25));
    dffr_maph : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(26), q => outputs(26));
    dffr_mapj : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(27), q => outputs(27));
    dffr_mapk : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(28), q => outputs(28));
    dffr_mapl : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(29), q => outputs(29));
    dffr_mapz : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(30), q => outputs(30));
    dffr_mapx : dffr_a port map (clk => clk, arst => '0', aload => '0', adata => '0', d => busWi, enable => res1(31), q => outputs(31));

end architecture structural;