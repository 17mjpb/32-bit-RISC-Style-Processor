-- and datapath_tb.vhd file: <This is the filename>
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- entity declaration only; no definition here
ENTITY tb_jump_and_link IS
END ENTITY tb_jump_and_link;

-- Architecture of the testbench with the signal names
ARCHITECTURE tb_jump_and_link_arch OF tb_jump_and_link IS -- Add any other signals to see in your simulation

SIGNAL Clock_tb, Clear_tb: std_logic;
SIGNAL PCout_tb, PCin_tb, IncPC_tb, IRin_tb: std_logic;
SIGNAL MARin_tb, Read_tb, MDRin_tb, MDRout_tb: std_logic;
SIGNAL Gra_tb, Grb_tb, BAout_tb, Rin_tb, Rout_tb, Cout_tb: std_logic;
SIGNAL Yin_tb, Zin_tb, ADD_tb, Zlowout_tb: std_logic;
SIGNAL BusData_tb : std_logic_vector (31 downto 0);

TYPE State IS (default, preLoadRegA, preLoadRegB, preLoadRegC, preLoadRegD, preLoadRegE, preLoadRegF,
T0, T1, T2, T3);

SIGNAL Present_state: State := default;
-- component instantiation of the datapath
COMPONENT datapath
	PORT (
		clk : IN STD_LOGIC;
		clear : IN STD_LOGIC;
		HIin : IN STD_LOGIC;
		LOin : IN STD_LOGIC;
		Yin : IN STD_LOGIC;
		PCin : IN STD_LOGIC;
		IncPC : IN STD_LOGIC;
		ANDin : IN STD_LOGIC;
		ORin : IN STD_LOGIC;
		NOTin : IN STD_LOGIC;
		NEGin : IN STD_LOGIC;
		ADDin : IN STD_LOGIC;
		SUBin : IN STD_LOGIC;
		MULin : IN STD_LOGIC;
		DIVin : IN STD_LOGIC;
		SRAin : IN STD_LOGIC;
		SLAin : IN STD_LOGIC;
		RORin : IN STD_LOGIC;
		ROLin : IN STD_LOGIC;
		Zin : IN STD_LOGIC;
		Write : IN STD_LOGIC;
		Read : IN STD_LOGIC;
		MDRin : IN STD_LOGIC;
		MARin : IN STD_LOGIC;
		OutPortin : IN STD_LOGIC;
		InPortin : IN STD_LOGIC;
		PCout : IN STD_LOGIC;
		HIout : IN STD_LOGIC;
		LOout : IN STD_LOGIC;
		Zhighout : IN STD_LOGIC;
		Zlowout : IN STD_LOGIC;
		MDRout : IN STD_LOGIC;
		Cout : IN STD_LOGIC;
		InPortout : IN STD_LOGIC;
		IRin : IN STD_LOGIC;
		Grb : IN STD_LOGIC;
		Gra : IN STD_LOGIC;
		Grc : IN STD_LOGIC;
		Rin : IN STD_LOGIC;
		Rout : IN STD_LOGIC;
		BAout : IN STD_LOGIC;
		CONin : IN STD_LOGIC;
		InputDeviceData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		CONout : OUT STD_LOGIC;
		BusData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		OutputDeviceData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT datapath;
BEGIN

DUT : datapath
	--port mapping: between the dut and the testbench signals
	PORT MAP (
		clk => Clock_tb,
		clear => Clear_tb,
		HIin => '0',
		LOin => '0',
		Yin => Yin_tb,
		PCin => PCin_tb,
		IncPC => IncPC_tb,
		ANDin => '0',
		ORin => '0',
		NOTin => '0',
		NEGin => '0',
		ADDin => ADD_tb,
		SUBin => '0',
		MULin => '0',
		DIVin => '0',
		SRAin => '0',
		SLAin => '0',
		RORin => '0',
		ROLin => '0',
		Zin => Zin_tb,
		Write => '0',
		Read => Read_tb,
		MDRin => MDRin_tb,
		MARin => MARin_tb,
		OutPortin => '0',
		InPortin => '0',
		PCout => PCout_tb,
		HIout => '0',
		LOout => '0',
		Zhighout => '0',
		Zlowout => Zlowout_tb,
		MDRout => MDRout_tb,
		Cout => Cout_tb,
		InPortout => '0',
		IRin => IRin_tb,
		Grb => Grb_tb,
		Gra => Gra_tb,
		Grc => '0',
		Rin => Rin_tb,
		Rout => Rout_tb,
		BAout => BAout_tb,
		CONin => '0',
		InputDeviceData => x"00000000",
		BusData => BusData_tb
	);
	--add test logic here
	Clock_process: PROCESS IS
		BEGIN
			Clock_tb <= '1', '0' after 20 ns;
			wait for 40 ns;
	END PROCESS Clock_process;

	PROCESS (Clock_tb) IS -- finite state machine
		BEGIN
			IF (rising_edge (Clock_tb)) THEN -- if clock rising-edge
				CASE Present_state IS
					WHEN Default =>
						Present_state <= preLoadRegA;
					WHEN preLoadRegA =>
						Present_state <= preLoadRegB;
					WHEN preLoadRegB =>
						Present_state <= preLoadRegC;
					WHEN preLoadRegC =>
						Present_state <= preLoadRegD;
					WHEN preLoadRegD =>
						Present_state <= preLoadRegE;
					WHEN preLoadRegE =>
						Present_state <= preLoadRegF;
					WHEN preLoadRegF =>
						Present_state <= T0;
					WHEN T0 =>
						Present_state <= T1;
					WHEN T1 =>
						Present_state <= T2;
					WHEN T2 =>
						Present_state <= T3;
					WHEN OTHERS =>
				END CASE;
			END IF;
	END PROCESS;

	PROCESS (Present_state) IS -- do the required job in each state
		BEGIN
			CASE Present_state IS -- assert the required signals in each clock cycle
				WHEN Default =>
					PCout_tb <= '0'; Zlowout_tb <= '0'; MDRout_tb <= '0'; -- initialize the signals
					Cout_tb <= '0'; Rout_tb <= '0'; BAout_tb <= '0';
					MARin_tb <= '0'; PCin_tb <='0'; MDRin_tb <= '0'; 
					IRin_tb <= '0'; Yin_tb <= '0'; Zin_tb <= '0'; Rin_tb <= '0';
					IncPC_tb <= '0'; Read_tb <= '0'; ADD_tb <= '0';
					Grb_tb <= '0'; Gra_tb <= '0';
					Clear_tb <= '0';
				WHEN preLoadRegA => -- see if you need to de-assert these signals
					PCout_tb <= '1'; MARin_tb <= '1';  Read_tb <= '1';
					Clear_tb <= '1';
				WHEN preLoadRegB =>
					PCout_tb <= '0'; MARin_tb <= '0';
					IncPC_tb <= '1'; PCin_tb <= '1'; MDRin_tb <= '1';
					-- 0F000000: 32-bit instruction for LD R15, (R0)PC+1
				WHEN preLoadRegC =>
					IncPC_tb <= '0'; PCin_tb <= '0'; MDRin_tb <= '0'; Read_tb <= '0';
					MDRout_tb <= '1'; IRin_tb <= '1';
				WHEN preLoadRegD =>
					MDRout_tb <= '0'; IRin_tb <= '0';
					Grb_tb <= '1'; BAout_tb <= '1'; Yin_tb <= '1';
				WHEN preLoadRegE =>
					Grb_tb <= '0'; BAout_tb <= '0'; Yin_tb <= '0';
					PCout_tb <= '1'; ADD_tb <= '1'; Zin_tb <= '1';
				WHEN preLoadRegF =>
					PCout_tb <= '0'; ADD_tb <= '0'; Zin_tb <= '0';
					Zlowout_tb <= '1'; Gra_tb <= '1'; Rin_tb <= '1';
				WHEN T0 => -- see if you need to de-assert these signals
					Zlowout_tb <= '0'; Gra_tb <= '0'; Rin_tb <= '0';
					PCout_tb <= '1'; MARin_tb <= '1'; Read_tb <= '1';
				WHEN T1 =>
					PCout_tb <= '0'; MARin_tb <= '0';
					IncPC_tb <= '1'; PCin_tb <= '1'; MDRin_tb <= '1';
					-- 0080000A: 32-bit instruction for JR R1
				WHEN T2 =>
					IncPC_tb <= '0'; PCin_tb <= '0'; MDRin_tb <= '0'; Read_tb <= '0';
					MDRout_tb <= '1'; IRin_tb <= '1';
				WHEN T3 =>
					MDRout_tb <= '0'; IRin_tb <= '0';
					Gra_tb <= '1'; Rout_tb <= '1'; PCin_tb <= '1';
			END CASE;
	END PROCESS;
END ARCHITECTURE tb_jump_and_link_arch;