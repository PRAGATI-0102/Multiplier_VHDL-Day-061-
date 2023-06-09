library ieee;
library work;
use ieee.std_logic_1164.all;
use work.Gates.all;


entity MUL is 
	
	port(A : in std_logic_vector(3 downto 0);
		  B : in std_logic_vector(2 downto 0);
		  M : out std_logic_vector(6 downto 0));
	
end entity; 

architecture structural of MUL is

	
	component AND_2 is
     port(A, B: in std_logic;
		    Y : out std_logic);
	
   end component;
	
	component ADD_SUB_4BIT is
     port(M   : in std_logic;
		  A, B: in std_logic_vector(3 downto 0);
		  S   : out std_logic_vector(3 downto 0);
		  Cout: out std_logic);
   end component;
	
	
	signal w1 : std_logic_vector(4 downto 1);
	signal p1,p2 : std_logic;

	signal x, y, z : std_logic_vector(3 downto 0);


	begin 

	A1 : AND_2 port map(A => A(0), B => B(0), Y => x(0));
	A2 : AND_2 port map(A => A(1), B => B(0), Y => x(1));
	A3 : AND_2 port map(A => A(2), B => B(0), Y => x(2));
	A4 : AND_2 port map(A => A(3), B => B(0), Y => x(3));
	
	A5 : AND_2 port map(A => A(0), B => B(1), Y => y(0));
	A6 : AND_2 port map(A => A(1), B => B(1), Y => y(1));
	A7 : AND_2 port map(A => A(2), B => B(1), Y => y(2));
	A8 : AND_2 port map(A => A(3), B => B(1), Y => y(3));
	
	A9  : AND_2 port map(A => A(0), B => B(2), Y => z(0));
	A10 : AND_2 port map(A => A(1), B => B(2), Y => z(1));
	A11 : AND_2 port map(A => A(2), B => B(2), Y => z(2));
	A12 : AND_2 port map(A => A(3), B => B(2), Y => z(3));
	
	O1 : OR_2 port map (A => x(0), B => '0', Y => M(0));
	
	F1 : ADD_SUB_4BIT port map(M => '0', A(0)=> x(1), A(1)=> x(2), A(2)=> x(3), A(3)=> '0',
													 B(0) => y(0), B(1) => y(1), B(2) => y(2),B(3) => y(3),
													 S => w1(4 downto 1), Cout => p1);
													 
	O2 : OR_2 port map (A => w1(1), B => '0', Y => M(1));
													 
	F2 : ADD_SUB_4BIT port map(M => '0', A(0)=> w1(2), A(1)=> w1(3), A(2)=> w1(4), A(3)=> p1,
													 B(0) => z(0), B(1) => z(1), B(2) => z(2),B(3) => z(3),
													 S => M(5 downto 2), Cout => M(6));
	

			
end structural;