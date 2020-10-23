library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity select_and_encode is
	port (
		IRout : in std_logic_vector(31 downto 0);
		Gra : in std_logic;
		Grb : in std_logic;
		Grc : in std_logic;
		Rin : in std_logic;
		Rout : in std_logic;
		BAout : in std_logic;
		R0out : out std_logic;
		R1out : out std_logic;
		R2out : out std_logic;
		R3out : out std_logic;
		R4out : out std_logic;
		R5out : out std_logic;
		R6out : out std_logic;
		R7out : out std_logic;
		R8out : out std_logic;
		R9out : out std_logic;
		R10out : out std_logic;
		R11out : out std_logic;
		R12out : out std_logic;
		R13out : out std_logic;
		R14out : out std_logic;
		R15out : out std_logic;
		R0in : out std_logic;
		R1in : out std_logic;
		R2in : out std_logic;
		R3in : out std_logic;
		R4in : out std_logic;
		R5in : out std_logic;
		R6in : out std_logic;
		R7in : out std_logic;
		R8in : out std_logic;
		R9in : out std_logic;
		R10in : out std_logic;
		R11in : out std_logic;
		R12in : out std_logic;
		R13in : out std_logic;
		R14in : out std_logic;
		R15in : out std_logic;
		c_sign_extended : out std_logic_vector(31 downto 0)
	);
end entity;

architecture behaviour of select_and_encode is

signal opcode : std_logic_vector(4 downto 0);
signal ra, rb, rc : std_logic_vector(3 downto 0);
signal s : std_logic;
signal decoderIn : std_logic_vector(3 downto 0);
signal decoderOut : std_logic_vector(15 downto 0);

begin

opcode <= IRout(31 downto 27);
ra <= IRout(26 downto 23) when Gra = '1' else (others => '0');
rb <= IRout(22 downto 19) when Grb = '1' else (others => '0');
rc <= IRout(18 downto 15) when Grc = '1' else (others => '0');

decoderIn <= ra OR rb OR rc;

s <= Rout OR BAout;

with decoderIn select
decoderOut <= x"0001" when "0000",
					x"0002" when "0001",
					x"0004" when "0010",
					x"0008" when "0011",
					x"0010" when "0100",
					x"0020" when "0101",
					x"0040" when "0110",
					x"0080" when "0111",
					x"0100" when "1000",
					x"0200" when "1001",
					x"0400" when "1010",
					x"0800" when "1011",
					x"1000" when "1100",
					x"2000" when "1101",
					x"4000" when "1110",
					x"8000" when others;
					
R0in <= decoderOut(0) AND Rin;
R0out <= decoderOut(0) AND s;

R1in <= decoderOut(1) AND Rin;
R1out <= decoderOut(1) AND s;

R2in <= decoderOut(2) AND Rin;
R2out <= decoderOut(2) AND s;

R3in <= decoderOut(3) AND Rin;
R3out <= decoderOut(3) AND s;

R4in <= decoderOut(4) AND Rin;
R4out <= decoderOut(4) AND s;

R5in <= decoderOut(5) AND Rin;
R5out <= decoderOut(5) AND s;

R6in <= decoderOut(6) AND Rin;
R6out <= decoderOut(6) AND s;

R7in <= decoderOut(7) AND Rin;
R7out <= decoderOut(7) AND s;

R8in <= decoderOut(8) AND Rin;
R8out <= decoderOut(8) AND s;

R9in <= decoderOut(9) AND Rin;
R9out <= decoderOut(9) AND s;

R10in <= decoderOut(10) AND Rin;
R10out <= decoderOut(10) AND s;

R11in <= decoderOut(11) AND Rin;
R11out <= decoderOut(11) AND s;

R12in <= decoderOut(12) AND Rin;
R12out <= decoderOut(12) AND s;

R13in <= decoderOut(13) AND Rin;
R13out <= decoderOut(13) AND s;

R14in <= decoderOut(14) AND Rin;
R14out <= decoderOut(14) AND s;

R15in <= decoderOut(15) AND Rin;
R15out <= decoderOut(15) AND s;

c_sign_extended <= std_logic_vector(resize(signed(IRout(18 downto 0)), c_sign_extended'length));
end architecture;
