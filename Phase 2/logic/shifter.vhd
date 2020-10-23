library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity shifter is
	port (
		shift_in : in std_logic_vector(31 downto 0);
		n : in std_logic_vector(4 downto 0);
		sel : in std_logic_vector(1 downto 0);
		shift_out : out std_logic_vector(31 downto 0);
		roll_out : out std_logic
	);
end entity;

architecture behavior of shifter is

signal shifted : std_logic_vector(31 downto 0);
signal roll_bit : std_logic;

begin
	process(shift_in,n,sel)
	variable n_temp : integer;
	variable left_roll_bit, right_roll_bit : std_logic;
	variable sign,zero : std_logic_vector(31 downto 0);
		begin
		n_temp := to_integer(unsigned(n));
		sign := (others => shift_in(31));
		zero := (others => '0');
		if(n_temp /= 0) then
			left_roll_bit := shift_in(32-n_temp);
			right_roll_bit := shift_in(n_temp-1);
			if(sel(0) = '0') then -- Right (1) vs left (0)
				shifted(31 downto n_temp) <= shift_in((31-n_temp) downto 0);
				roll_bit <= left_roll_bit;
				if(sel(1) = '0') then -- Roll (1) vs shift (0)
					shifted((n_temp-1) downto 0) <= zero((n_temp-1) downto 0);
				else
					shifted((n_temp-1) downto 0) <= shift_in(31 downto (31-n_temp+1));
				end if;
			else
				shifted((31-n_temp) downto 0) <= shift_in(31 downto n_temp);
				roll_bit <= right_roll_bit;
				if(sel(1) = '0') then
					shifted(31 downto (31-n_temp+1)) <= sign((n_temp-1) downto 0);
				else
					shifted(31 downto (31-n_temp+1)) <= shift_in((n_temp-1) downto 0);
				end if;	
			end if;
		end if;
	end process;
shift_out <= shifted;
roll_out <= roll_bit;
end architecture;