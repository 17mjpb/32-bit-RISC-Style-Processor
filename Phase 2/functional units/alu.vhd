library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
	port ( 
		alu_A : in std_logic_vector(31 downto 0);
		alu_B : in  std_logic_vector(31 downto 0);
		SEL : in std_logic_vector(3 downto 0);
		C_hi : out std_logic_vector(31 downto 0);
		C_lo : out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of alu is

component cl_addr
	port (
		A : in std_logic_vector	(31 downto 0);
		B : in std_logic_vector	(31 downto 0);
		Cin : in std_logic;
		S : out std_logic_vector (31 downto 0);
		Cout : out std_logic
	);
end component cl_addr;

component negator
	port (
		neg_in : in std_logic_vector(31 downto 0);
		neg_out : out std_logic_vector(31 downto 0)
	);
end component negator;

component shifter
	port(
		shift_in : in std_logic_vector(31 downto 0);
		n : in std_logic_vector(4 downto 0);
		sel : in std_logic_vector(1 downto 0);
		shift_out : out std_logic_vector(31 downto 0);
		roll_out : out std_logic
	);
end component shifter;

component mux2to1_32 
	port( 
		SEL: in std_logic; -- selection bit input
		X0_in: in std_logic_vector(31 downto 0); -- first input
		X1_in: in std_logic_vector(31 downto 0); -- second input
		Y: out std_logic_vector(31 downto 0)  -- output
	);
end component mux2to1_32;

component multiplier is
	port (
		inputA	: in std_logic_vector(31 downto 0);
		inputB	: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(63 downto 0)
	);
end component;

component divider is
	port (
		inputA	: in std_logic_vector(31 downto 0);
		inputB	: in std_logic_vector(31 downto 0);
		quotient: out std_logic_vector(31 downto 0);
		remainder: out std_logic_vector(31 downto 0)
	);
end component;

signal NEGout : std_logic_vector (31 downto 0) := (others => '0');
signal ADDout : std_logic_vector (31 downto 0) := (others => '0');
signal SUBout : std_logic_vector (31 downto 0) := (others => '0');
signal MULout : std_logic_vector (63 downto 0) := (others => '0');
signal DIVout_remainder : std_logic_vector (31 downto 0) := (others => '0');
signal DIVout_quotient : std_logic_vector (31 downto 0) := (others => '0');
signal SRAout : std_logic_vector (31 downto 0) := (others => '0');
signal SLAout : std_logic_vector (31 downto 0) := (others => '0');
signal RORout : std_logic_vector (31 downto 0) := (others => '0');
signal ROLout : std_logic_vector (31 downto 0) := (others => '0');

begin

negator_neg : negator port map (
	alu_B,
	NEGout
);

cl_addr_add : cl_addr port map (
	alu_A,
	alu_B,
	'0',
	ADDout
);

cl_addr_sub : cl_addr port map (
	alu_A,
	NEGout,
	'0',
	SUBout
);

shift_left_aritmetic : shifter port map (
	alu_A,
	alu_B(4 downto 0) ,
	"00",
	SLAout
);

shift_right_aritmetic : shifter port map (
	alu_A,
	alu_B(4 downto 0),
	"01",
	SRAout
);

rotate_over_left : shifter port map (
	alu_A,
	alu_B(4 downto 0),
	"10",
	ROLout
);

rotate_over_right : shifter port map (
	alu_A,
	alu_B(4 downto 0),
	"11",
	RORout
);

divide : divider port map (
	alu_A,
	alu_B,
	DIVout_quotient,
	DIVout_remainder
);

multiply : multiplier port map (
	alu_A,
	alu_B,
	MULout
);
				
	process(NEGout, ADDout, SUBout, SLAout, SRAout, ROLout, RORout, DIVout_quotient, DIVout_remainder, MULout, SEL)
		begin
			if (SEL = "0000") then -- AND
				inst_AND : for i in 0 to 31 loop
					C_lo(i) <= alu_A(i) and alu_B(i);
				end loop;
			C_hi <= x"00000000";
			elsif (SEL = "0001") then -- OR
				inst_OR : for i in 0 to 31 loop
					C_lo(i) <= alu_A(i) or alu_B(i);
				end loop;
			C_hi <= x"00000000";
			elsif (SEL = "0010") then -- NOT
				inst_NOT : for i in 0 to 31 loop
					C_lo(i) <= not alu_B(i);
				end loop;
			C_hi <= x"00000000";
			elsif (SEL = "0011") then -- NEG
				C_lo <= NEGout;
				C_hi <= x"00000000";
			elsif (SEL = "0100") then -- ADD
				C_lo <= ADDout;
				C_hi <= x"00000000";
			elsif (SEL = "0101") then -- SUB
				C_lo <= SUBout;
				C_hi <= x"00000000";
			elsif (SEL = "0110") then -- MUL
				C_lo <= MULout(31 downto 0);
				C_hi <= MULout(63 downto 32);
			elsif (SEL = "0111") then -- DIV
				C_lo <= DIVout_quotient;
				C_hi <= DIVout_remainder;
			elsif (SEL = "1000") then -- SRA
				C_lo <= SRAout;
				C_hi <= x"00000000";
			elsif (SEL = "1001") then -- SLA
				C_lo <= SLAout;
				C_hi <= x"00000000";
			elsif (SEL = "1010") then -- ROR
				C_lo <= RORout;
				C_hi <= x"00000000";
			elsif (SEL = "1011") then -- ROL
				C_lo <= ROLout;
				C_hi <= x"00000000";
			else
				C_lo <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
				C_hi <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			end if;
	end process;
end architecture;