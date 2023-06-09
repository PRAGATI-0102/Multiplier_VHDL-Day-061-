library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.all;
use WORK.Gates.all;

entity AND_gate is
	port(A: in std_logic;
		  B: in std_logic;
		  Y: out std_logic);
end entity AND_gate;

architecture struct of AND_gate is

signal w1 : std_logic; 

begin
	N1 : NAND_2
	port map (A => A, B => B, Y => w1);
	N2 : NAND_2
	port map (A => w1, B => w1, Y => Y);
	
	
end architecture struct;