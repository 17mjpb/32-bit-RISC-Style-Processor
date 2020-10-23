library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram32 is
	port (
		clk : in std_logic;
		reset_n : in std_logic;
		w_en : in std_logic;
		r_en : in std_logic;
		dataIn : in std_logic_vector(31 downto 0);
		addr : in std_logic_vector(31 downto 0);
		dataOut : out std_logic_vector(31 downto 0)
	);
end entity;

architecture behaviour of ram32 is

type ram_array is array(0 to 511) of std_logic_vector(31 downto 0);
signal ram : ram_array;

begin

	process(clk, reset_n)
		begin
		if (reset_n = '0') then
			ram <= (others => x"00000000"); -- set all ram values to 0;
			ram(0) <= x"00800035"; -- Load first instruction at address 0 of ram
			ram(1) <= x"00800090"; -- Load next instructions at the next ram address the next ram address
			ram(2) <= x"00800090";
			ram(53) <= x"00000001";
			ram(145) <= x"FFFFFFFF"; -- This should be overwritten to 0x00000000 if store works correctly
		elsif (rising_edge(clk)) then
			if (w_en = '1') then
				ram(to_integer(unsigned(addr(8 downto 0)))) <= dataIn;
			elsif (r_en = '1') then
				dataOut <= ram(to_integer(unsigned(addr(8 downto 0))));
			end if;
		end if;
	end process;
end architecture;