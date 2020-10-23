library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity encoder_32to5 is
 port(
	x0 : in std_logic := '0';
	x1 : in std_logic := '0';
	x2 : in std_logic := '0';
	x3 : in std_logic := '0';
	x4 : in std_logic := '0';
	x5 : in std_logic := '0';
	x6 : in std_logic := '0';
	x7 : in std_logic := '0';
	x8 : in std_logic := '0';
	x9 : in std_logic := '0';
	x10 : in std_logic := '0';
	x11 : in std_logic := '0';
	x12 : in std_logic := '0';
	x13 : in std_logic := '0';
	x14 : in std_logic := '0';
	x15 : in std_logic := '0';
	x16 : in std_logic := '0';
	x17 : in std_logic := '0';
	x18 : in std_logic := '0';
	x19 : in std_logic := '0';
	x20 : in std_logic := '0';
	x21 : in std_logic := '0';
	x22 : in std_logic := '0';
	x23 : in std_logic := '0';
	x24 : in std_logic := '0';
	x25 : in std_logic := '0';
	x26 : in std_logic := '0';
	x27 : in std_logic := '0';
	x28 : in std_logic := '0';
	x29 : in std_logic := '0';
	x30 : in std_logic := '0';
	x31 : in std_logic := '0';
	sel0 : out std_logic;
	sel1 : out std_logic;
	sel2 : out std_logic;
	sel3 : out std_logic;
	sel4 : out std_logic
 );
end entity;
 
architecture behavior of encoder_32to5 is

signal a : std_logic_vector(31 downto 0):= (others => '0');
signal b : std_logic_vector(4 downto 0) := (others => '0');

begin

a(0) <= x0;
a(1) <= x1;
a(2) <= x2;
a(3) <= x3;
a(4) <= x4;
a(5) <= x5;
a(6) <= x6;
a(7) <= x7;
a(8) <= x8;
a(9) <= x9;
a(10) <= x10;
a(11) <= x11;
a(12) <= x12;
a(13) <= x13;
a(14) <= x14;
a(15) <= x15;
a(16) <= x16;
a(17) <= x17;
a(18) <= x18;
a(19) <= x19;
a(20) <= x20;
a(21) <= x21;
a(22) <= x22;
a(23) <= x23;
a(24) <= x24;
a(25) <= x25;
a(26) <= x26;
a(27) <= x27;
a(28) <= x28;
a(29) <= x29;
a(30) <= x30;
a(31) <= x31;

	process(a)
	begin
	
	if (a="00000000000000000000000000000001") then
		b <= "00000";
	elsif (a="00000000000000000000000000000010") then
		b <= "00001";
	elsif (a="00000000000000000000000000000100") then
		b <= "00010";
	elsif (a="00000000000000000000000000001000") then
		b <= "00011";
	elsif (a="00000000000000000000000000010000") then
		b <= "00100";
	elsif (a="00000000000000000000000000100000") then
		b <= "00101";
	elsif (a="00000000000000000000000001000000") then
		b <= "00110";
	elsif (a="00000000000000000000000010000000") then
		b <= "00111";
	elsif (a="00000000000000000000000100000000") then
		b <= "01000";
	elsif (a="00000000000000000000001000000000") then
		b <= "01001";
	elsif (a="00000000000000000000010000000000") then
		b <= "01010";
	elsif (a="00000000000000000000100000000000") then
		b <= "01011";
	elsif (a="00000000000000000001000000000000") then
		b <= "01100";
	elsif (a="00000000000000000010000000000000") then
		b <= "01101";
	elsif (a="00000000000000000100000000000000") then
		b <= "01110";
	elsif (a="00000000000000001000000000000000") then
		b <= "01111";
	elsif (a="00000000000000010000000000000000") then
		b <= "10000";
	elsif (a="00000000000000100000000000000000") then
		b <= "10001";
	elsif (a="00000000000001000000000000000000") then
		b <= "10010";
	elsif (a="00000000000010000000000000000000") then
		b <= "10011";
	elsif (a="00000000000100000000000000000000") then
		b <= "10100";
	elsif (a="00000000001000000000000000000000") then
		b <= "10101";
	elsif (a="00000000010000000000000000000000") then
		b <= "10110";
	elsif (a="00000000100000000000000000000000") then
		b <= "10111";
	elsif (a="00000001000000000000000000000000") then
		b <= "11000";
	elsif (a="00000010000000000000000000000000") then
		b <= "11001";
	elsif (a="00000100000000000000000000000000") then
		b <= "11010";
	elsif (a="00001000000000000000000000000000") then
		b <= "11011";
	elsif (a="00010000000000000000000000000000") then
		b <= "11100";
	elsif (a="00100000000000000000000000000000") then
		b <= "11101";
	elsif (a="01000000000000000000000000000000") then
		b <= "11110";
	elsif (a="10000000000000000000000000000000") then
		b <= "11111";
	else
		b <= "ZZZZZ";
	end if;
	end process;
sel0 <= b(0);
sel1 <= b(1);
sel2 <= b(2);
sel3 <= b(3);
sel4 <= b(4);	
end architecture;
