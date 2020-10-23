library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity alu_addr_encoder is
 port(
	ANDin : in std_logic := '0';
	ORin : in std_logic := '0';
	NOTin : in std_logic := '0';
	NEGin : in std_logic := '0';
	ADDin : in std_logic := '0';
	SUBin : in std_logic := '0';
	MULin : in std_logic := '0';
	DIVin : in std_logic := '0';
	SRAin : in std_logic := '0';
	SLAin : in std_logic := '0';
	RORin : in std_logic := '0';
	ROLin : in std_logic := '0';
	ALU_sel : out std_logic_vector(3 downto 0)
);
end entity;
architecture behavior of alu_addr_encoder is

signal a : std_logic_vector(11 downto 0) := (others => '0');
signal b : std_logic_vector(3 downto 0) := (others => '0');

begin

a(0) <= ANDin;
a(1) <= ORin;
a(2) <= NOTin;
a(3) <= NEGin;
a(4) <= ADDin;
a(5) <= SUBin;
a(6) <= MULin;
a(7) <= DIVin;
a(8) <= SRAin;
a(9) <= SLAin;
a(10) <= RORin;
a(11) <= ROLin;

	process(a)
	begin
	if (a="000000000001") then
		b <= "0000";
	elsif (a="000000000010") then
		b <= "0001";
	elsif (a="000000000100") then
		b <= "0010";
	elsif (a="000000001000") then
		b <= "0011";
	elsif (a="000000010000") then
		b <= "0100";
	elsif (a="000000100000") then
		b <= "0101";
	elsif (a="000001000000") then
		b <= "0110";
	elsif (a="000010000000") then
		b <= "0111";
	elsif (a="000100000000") then
		b <= "1000";
	elsif (a="001000000000") then
		b <= "1001";
	elsif (a="010000000000") then
		b <= "1010";
	elsif (a="100000000000") then
		b <= "1011";
	else
		b <= "ZZZZ";
	end if;
	end process;
ALU_sel <= b;	
end architecture;