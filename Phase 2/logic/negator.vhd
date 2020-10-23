library ieee;
use ieee.std_logic_1164.all;

entity negator is
	port ( 
		neg_in : in std_logic_vector(31 downto 0);
		neg_out : out  std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of negator is

component incrementer
	port (
		input : in std_logic_vector	(31 downto 0);
		output : out std_logic_vector	(31 downto 0)
	);
end component incrementer;
 
signal temp : std_logic_vector(31 downto 0);
begin

inst : for i in 0 to 31 generate
	temp(i) <= not neg_in(i);
end generate;
	
incrementer_neg : incrementer port map (
	temp,
	neg_out
);
end architecture;