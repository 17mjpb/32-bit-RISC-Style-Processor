library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conFF is
	port (
		clk : in std_logic;
		clr : in std_logic;
		IRout : in std_logic_vector(31 downto 0);
		BusMuxOut : in std_logic_vector(31 downto 0);
		CONin : in std_logic;
		CONout : out std_logic
	);
end entity;

architecture behaviour of conFF is

signal opcode : std_logic_vector(4 downto 0);
signal ra : std_logic_vector(3 downto 0);
signal c2 : std_logic_vector(3 downto 0);
signal c : std_logic_vector(18 downto 0);
signal decoderIn : std_logic_vector(1 downto 0);
signal decoderOut : std_logic_vector(3 downto 0);
signal NORBus, s1, s2, s3, s4, f : std_logic;

begin

opcode <= IRout(31 downto 27);
ra <= IRout(26 downto 23);
c2 <= IRout(22 downto 19);
c <= IRout(18 downto 0);

decoderIn(0) <= c2(0); decoderIn(1) <= c2(1);

with decoderIn select
decoderOut <= "0001" when "00",
					"0010" when "01",
					"0100" when "10",
					"1000" when others;
					
NORBus <= '1' when (BusMuxOut = x"00000000") else '0';

s1 <= NORBus AND decoderOut(0);
s2 <= (NOT NORBus) AND decoderOut(1);
s3 <= (NOT BusMuxOut(31)) AND decoderOut(2);
s4 <= BusMuxOut(31) AND decoderOut(3);

f <= s1 OR s2 OR s3 OR s4;

	process(clk, CONin)
		begin
			if (clr = '0') then
				CONout <= '0';
			elsif (rising_edge(clk)) then
				if (CONin = '1') then
					CONout <= f;
				end if;
			end if;
	end process;
end architecture;
