LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY r0 IS 
	PORT
	(
		clk : IN STD_LOGIC;
		clear : IN STD_LOGIC;
		R0in : IN STD_LOGIC;
		BAout : IN STD_LOGIC;
		BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END r0;

ARCHITECTURE bdf_type OF r0 IS 

COMPONENT reg32
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL BAout_vect : STD_LOGIC_VECTOR(31 downto 0);
SIGNAL output : STD_LOGIC_VECTOR(31 downto 0);

BEGIN

b2v_r0 : reg32 PORT MAP(
	clk => clk,
	reset_n => clear,
	en => R0in,
	d => BusMuxOut,
	q => output
);

BAout_vect <= (others => NOT BAout);	
BUSMuxIn_R0 <= output AND BAout_vect;

END bdf_type;