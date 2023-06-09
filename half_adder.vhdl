library ieee;
library work;
use ieee.std_logic_1164.all;
use work.Gates.all;


entity half_adder is 
	
	port(A, B: in std_logic;
		  S, C: out std_logic);
	
end entity; 

architecture structural of half_adder is
	component XOR_gate is
     port(A: in std_logic;
		    B: in std_logic;
		    Y: out std_logic);
   end component;
	
	component AND_gate is
     port(A: in std_logic;
		    B: in std_logic;
		    Y: out std_logic);
   end component;
	begin 
		G1: XOR_gate port map(A => A, B => B, Y => S);
		G2: AND_gate port map(A => A, B => B, Y => C);	
		
end structural;