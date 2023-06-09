library ieee;
library work;
use ieee.std_logic_1164.all;
use work.Gates.all; 

entity OR_gate is 
	
	port(A, B: in std_logic;
		  Y:   out std_logic);
	
end entity; 

architecture structural of OR_gate is
	signal w1,w2 : std_logic; 
	begin 
		N1: NAND_2 port map(A => A, B => A, Y => w1);
		N2: NAND_2 port map(A => B, B => B, Y => w2);	
		N3: NAND_2 port map(A => w1, B => w2, Y => Y);	
end structural;