library ieee;
library work;
use ieee.std_logic_1164.all;
use work.Gates.all;


entity full_adder is 
	
	port(A, B, Cin: in std_logic;
		  S, C: out std_logic);
	
end entity; 

architecture structural of full_adder is
	component half_adder is
     port(A: in std_logic;
		    B: in std_logic;
		    S: out std_logic;
			 C: out std_logic);
   end component;
	
	component OR_gate is
     port(A: in std_logic;
		    B: in std_logic;
		    Y: out std_logic);
   end component;
	
	signal w1,w2,w3 : std_logic; 

	begin 
		H1: half_adder port map(A => A, B => B, S => w1, C => w2);
		H2: half_adder port map(A => Cin, B => w1, S => S, C => w3);	
		O1: OR_gate port map(A => w2, B => w3, Y => C);
		
end structural;