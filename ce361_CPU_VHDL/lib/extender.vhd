library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity extender is
    port (
    x      : in std_logic_vector(15 downto 0);
    z      : out std_logic_vector(31 downto 0)
    );
end extender;

architecture structural of extender is
    signal extend0 : std_logic_vector(15 downto 0) :="0000000000000000";
    signal extend1 : std_logic_vector(15 downto 0) :="1111111111111111";
    signal extended0 : std_logic_vector(31 downto 0);
    signal extended1 : std_logic_vector(31 downto 0);
    
begin
    extended0 <= extend0 & x;
    extended1 <= extend1 & x;
    mux_map : mux_32 port map (sel => x(15), src0 => extended0, src1 => extended1, z => z);
end architecture structural;