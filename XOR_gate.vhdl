library ieee;
library work;
use ieee.std_logic_1164.all;
use work.Gates.all; 

entity XOR_gate is 
	
	port(A, B: in std_logic;
		  Y:   out std_logic);
	
end entity; 

architecture struct of XOR_gate is
	signal w1,w2,w3 : std_logic; 
	begin 
		N1: NAND_2
		port map(A => A, B => B, Y => w1);
		
		N2: NAND_2
		port map(A => A, B => w1, Y => w2);	
		
		N3: NAND_2
		port map(A => w1, B => B, Y => w3);
		
		N4: NAND_2
		port map(A => w2, B => w3, Y => Y);	
		
end architecture struct;