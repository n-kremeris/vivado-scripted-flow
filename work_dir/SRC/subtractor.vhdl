-- Basic VHDL subtractor
-- Copyright Norbertas Kremeris 2021
-- www.itsembedded.com

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor_vhdl is
   port (
	x   : in  std_logic_vector(31 downto 0);
	y   : in  std_logic_vector(31 downto 0);
	sub : out std_logic_vector(31 downto 0)
   );
end entity subtractor_vhdl;

architecture rtl of subtractor_vhdl is
begin
    process(x, y) begin
	    SUB     <= std_logic_vector( signed(x) - signed(y) );
    end process;
end architecture rtl; 
