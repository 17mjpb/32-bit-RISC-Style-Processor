library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

---------------------------------------------------

entity mux32to1_32 is
port( 
	SEL0 : in std_logic; -- Selection vector bit 0
	SEL1 : in std_logic; -- 1
	SEL2 : in std_logic; -- 2
	SEL3 : in std_logic; -- 3
	SEL4 : in std_logic; -- 4
	X0_in : in std_logic_vector(31 downto 0) := (others => '0'); -- Input vector 0
	X1_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 1
	X2_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 2
	X3_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 3
	X4_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 4
	X5_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 5
	X6_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 6
	X7_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 7
	X8_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 8
	X9_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 9
	X10_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 10
	X11_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 11
	X12_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 12
	X13_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 13
	X14_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 14
	X15_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 15
	X16_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 16
	X17_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 17
	X18_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 18
	X19_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 19
	X20_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 20
	X21_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 21
	X22_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 22
	X23_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 23
	X24_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 24
	X25_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 25
	X26_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 26
	X27_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 27
	X28_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 28
	X29_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 29
	X30_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 30
	X31_in : in std_logic_vector(31 downto 0):= (others => '0'); -- 31
	Y_out : out std_logic_vector(31 downto 0)); -- Output

end entity mux32to1_32;

----------------------------------------------------

architecture mux32to1_32_arch of mux32to1_32 is
signal SEL : std_logic_vector(4 downto 0);

begin

SEL(0) <= SEL0;
SEL(1) <= SEL1;
SEL(2) <= SEL2;
SEL(3) <= SEL3;
SEL(4) <= SEL4;

    Y_out <= X0_in when (SEL = "00000") else
	 X1_in when (SEL = "00001") else
	 X2_in when (SEL = "00010") else
	 X3_in when (SEL = "00011") else
	 X4_in when (SEL = "00100") else
	 X5_in when (SEL = "00101") else
	 X6_in when (SEL = "00110") else
	 X7_in when (SEL = "00111") else
	 X8_in when (SEL = "01000") else
	 X9_in when (SEL = "01001") else
	 X10_in when (SEL = "01010") else
	 X11_in when (SEL = "01011") else
	 X12_in when (SEL = "01100") else
	 X13_in when (SEL = "01101") else
	 X14_in when (SEL = "01110") else
	 X15_in when (SEL = "01111") else 
	 X16_in when (SEL = "10000") else
	 X17_in when (SEL = "10001") else
	 X18_in when (SEL = "10010") else
	 X19_in when (SEL = "10011") else
	 X20_in when (SEL = "10100") else
	 X21_in when (SEL = "10101") else
	 X22_in when (SEL = "10110") else
	 X23_in when (SEL = "10111") else
	 X24_in when (SEL = "11000") else
	 X25_in when (SEL = "11001") else
	 X26_in when (SEL = "11010") else
	 X27_in when (SEL = "11011") else
	 X28_in when (SEL = "11100") else
	 X29_in when (SEL = "11101") else
	 X30_in when (SEL = "11110") else X31_in;

end architecture mux32to1_32_arch; 