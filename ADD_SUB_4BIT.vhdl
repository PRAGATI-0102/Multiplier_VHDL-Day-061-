library ieee;
library work;
use ieee.std_logic_1164.all;
use work.Gates.all;


entity ADD_SUB_4BIT is 
	
	port(M   : in std_logic;
		  A, B: in std_logic_vector(3 downto 0);
		  S   : out std_logic_vector(3 downto 0);
		  Cout: out std_logic);
	
end entity; 

architecture structural of ADD_SUB_4BIT is

	component full_adder is
     port(A, B, Cin: in std_logic;
		    S, C: out std_logic);
   end component;
	
	component XOR_gate is
     port(A: in std_logic;
		    B: in std_logic;
		    Y: out std_logic);
   end component;
	
	signal c1,c2,c3 : std_logic;
	signal temp : std_logic_vector(3 downto 0);

	begin 
	
		X1: XOR_gate port map(A => B(0), B => M, Y => temp(0));
		X2: XOR_gate port map(A => B(1), B => M, Y => temp(1));
		X3: XOR_gate port map(A => B(2), B => M, Y => temp(2));
		X4: XOR_gate port map(A => B(3), B => M, Y => temp(3));
		
		F1: full_adder port map(A => A(0), B => temp(0), Cin => M, S => S(0), C => c1);	
		F2: full_adder port map(A => A(1), B => temp(1), Cin => c1, S => S(1), C => c2);	
		F3: full_adder port map(A => A(2), B => temp(2), Cin => c2, S => S(2), C => c3);	
		F4: full_adder port map(A => A(3), B => temp(3), Cin => c3, S => S(3), C => Cout);	
		
end structural;