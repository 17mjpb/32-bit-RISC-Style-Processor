-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Sat Feb 29 16:33:13 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY datapath IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		clear :  IN  STD_LOGIC;
		R0out :  IN  STD_LOGIC;
		R1out :  IN  STD_LOGIC;
		R2out :  IN  STD_LOGIC;
		R3out :  IN  STD_LOGIC;
		R4out :  IN  STD_LOGIC;
		R5out :  IN  STD_LOGIC;
		R6out :  IN  STD_LOGIC;
		R7out :  IN  STD_LOGIC;
		R8out :  IN  STD_LOGIC;
		R9out :  IN  STD_LOGIC;
		R10out :  IN  STD_LOGIC;
		R11out :  IN  STD_LOGIC;
		R12out :  IN  STD_LOGIC;
		R13out :  IN  STD_LOGIC;
		R14out :  IN  STD_LOGIC;
		R15out :  IN  STD_LOGIC;
		HIout :  IN  STD_LOGIC;
		LOout :  IN  STD_LOGIC;
		Zlowout :  IN  STD_LOGIC;
		Zhighout :  IN  STD_LOGIC;
		MDRout :  IN  STD_LOGIC;
		PCout :  IN  STD_LOGIC;
		Cout :  IN  STD_LOGIC;
		InPortout :  IN  STD_LOGIC;
		R0in :  IN  STD_LOGIC;
		R1in :  IN  STD_LOGIC;
		R2in :  IN  STD_LOGIC;
		R3in :  IN  STD_LOGIC;
		R4in :  IN  STD_LOGIC;
		R5in :  IN  STD_LOGIC;
		R6in :  IN  STD_LOGIC;
		R7in :  IN  STD_LOGIC;
		R8in :  IN  STD_LOGIC;
		R9in :  IN  STD_LOGIC;
		R10in :  IN  STD_LOGIC;
		R11in :  IN  STD_LOGIC;
		R12in :  IN  STD_LOGIC;
		R13in :  IN  STD_LOGIC;
		R14in :  IN  STD_LOGIC;
		R15in :  IN  STD_LOGIC;
		HIin :  IN  STD_LOGIC;
		LOin :  IN  STD_LOGIC;
		Read :  IN  STD_LOGIC;
		MDRin :  IN  STD_LOGIC;
		InPortin :  IN  STD_LOGIC;
		Yin :  IN  STD_LOGIC;
		PCin :  IN  STD_LOGIC;
		IncPC :  IN  STD_LOGIC;
		IRin :  IN  STD_LOGIC;
		MARin :  IN  STD_LOGIC;
		OutPortin :  IN  STD_LOGIC;
		ANDin :  IN  STD_LOGIC;
		ORin :  IN  STD_LOGIC;
		NOTin :  IN  STD_LOGIC;
		NEGin :  IN  STD_LOGIC;
		ADDin :  IN  STD_LOGIC;
		SUBin :  IN  STD_LOGIC;
		MULin :  IN  STD_LOGIC;
		DIVin :  IN  STD_LOGIC;
		SRAin :  IN  STD_LOGIC;
		SLAin :  IN  STD_LOGIC;
		RORin :  IN  STD_LOGIC;
		ROLin :  IN  STD_LOGIC;
		Zin :  IN  STD_LOGIC;
		MemDataIn :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusData :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		IRout :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		MARout :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		MemDataOut :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		OutPortout :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END datapath;

ARCHITECTURE bdf_type OF datapath IS 

COMPONENT hi
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 HIin : IN STD_LOGIC;
		 BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_HI : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg32
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT gp
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 R0in : IN STD_LOGIC;
		 R1in : IN STD_LOGIC;
		 R2in : IN STD_LOGIC;
		 R3in : IN STD_LOGIC;
		 R4in : IN STD_LOGIC;
		 R5in : IN STD_LOGIC;
		 R6in : IN STD_LOGIC;
		 R7in : IN STD_LOGIC;
		 R8in : IN STD_LOGIC;
		 R9in : IN STD_LOGIC;
		 R10in : IN STD_LOGIC;
		 R11in : IN STD_LOGIC;
		 R12in : IN STD_LOGIC;
		 R13in : IN STD_LOGIC;
		 R14in : IN STD_LOGIC;
		 R15in : IN STD_LOGIC;
		 BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R0in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R10in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R11in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R12in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R13in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R14in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R15in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R1in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R2in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R3in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R4in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R5in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R6in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R7in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R8in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R9in : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu_addr_encoder
	PORT(ANDin : IN STD_LOGIC;
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
		 ALU_sel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT bidirectional_bus
	PORT(R0out : IN STD_LOGIC;
		 R1out : IN STD_LOGIC;
		 R2out : IN STD_LOGIC;
		 R3out : IN STD_LOGIC;
		 R4out : IN STD_LOGIC;
		 R5out : IN STD_LOGIC;
		 R6out : IN STD_LOGIC;
		 R7out : IN STD_LOGIC;
		 R8out : IN STD_LOGIC;
		 R9out : IN STD_LOGIC;
		 R10out : IN STD_LOGIC;
		 R11out : IN STD_LOGIC;
		 R12out : IN STD_LOGIC;
		 R13out : IN STD_LOGIC;
		 R14out : IN STD_LOGIC;
		 R15out : IN STD_LOGIC;
		 PCout : IN STD_LOGIC;
		 HIout : IN STD_LOGIC;
		 LOout : IN STD_LOGIC;
		 Zhighout : IN STD_LOGIC;
		 Zlowout : IN STD_LOGIC;
		 MDRout : IN STD_LOGIC;
		 Cout : IN STD_LOGIC;
		 InPortout : IN STD_LOGIC;
		 BusMuxIn_HI : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_InPort : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_LO : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_MDR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_PC : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R0in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R10in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R11in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R12in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R13in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R14in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R15in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R1in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R2in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R3in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R4in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R5in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R6in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R7in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R8in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_R9in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_Zhigh : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_Zlow : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 c_sign_extended : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu
	PORT(alu_A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 alu_B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 C_hi : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C_lo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT y
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 Yin : IN STD_LOGIC;
		 BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ALUIn_Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT z
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 Zin : IN STD_LOGIC;
		 Zhi_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Zlo_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_Zhi : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_Zlow : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lo
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 LOin : IN STD_LOGIC;
		 BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_LO : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mdr
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 MDRin : IN STD_LOGIC;
		 Read : IN STD_LOGIC;
		 BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 MemDataIn : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_MDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 MemIn_MDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pc
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 PCin : IN STD_LOGIC;
		 IncPC : IN STD_LOGIC;
		 BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxIn_PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN 

BusData <= SYNTHESIZED_WIRE_1;

b2v_HI : hi
PORT MAP(clk => clk,
		 clear => clear,
		 HIin => HIin,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 BusMuxIn_HI => SYNTHESIZED_WIRE_3);


b2v_in_port : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => InPortin,
		 d => SYNTHESIZED_WIRE_1,
		 q => SYNTHESIZED_WIRE_4);


b2v_gp : gp
PORT MAP(clk => clk,
		 clear => clear,
		 R0in => R0in,
		 R1in => R1in,
		 R2in => R2in,
		 R3in => R3in,
		 R4in => R4in,
		 R5in => R5in,
		 R6in => R6in,
		 R7in => R7in,
		 R8in => R8in,
		 R9in => R9in,
		 R10in => R10in,
		 R11in => R11in,
		 R12in => R12in,
		 R13in => R13in,
		 R14in => R14in,
		 R15in => R15in,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 BusMuxIn_R0in => SYNTHESIZED_WIRE_8,
		 BusMuxIn_R10in => SYNTHESIZED_WIRE_9,
		 BusMuxIn_R11in => SYNTHESIZED_WIRE_10,
		 BusMuxIn_R12in => SYNTHESIZED_WIRE_11,
		 BusMuxIn_R13in => SYNTHESIZED_WIRE_12,
		 BusMuxIn_R14in => SYNTHESIZED_WIRE_13,
		 BusMuxIn_R15in => SYNTHESIZED_WIRE_14,
		 BusMuxIn_R1in => SYNTHESIZED_WIRE_15,
		 BusMuxIn_R2in => SYNTHESIZED_WIRE_16,
		 BusMuxIn_R3in => SYNTHESIZED_WIRE_17,
		 BusMuxIn_R4in => SYNTHESIZED_WIRE_18,
		 BusMuxIn_R5in => SYNTHESIZED_WIRE_19,
		 BusMuxIn_R6in => SYNTHESIZED_WIRE_20,
		 BusMuxIn_R7in => SYNTHESIZED_WIRE_21,
		 BusMuxIn_R8in => SYNTHESIZED_WIRE_22,
		 BusMuxIn_R9in => SYNTHESIZED_WIRE_23);


b2v_alu_addr_encoder : alu_addr_encoder
PORT MAP(ANDin => ANDin,
		 ORin => ORin,
		 NOTin => NOTin,
		 NEGin => NEGin,
		 ADDin => ADDin,
		 SUBin => SUBin,
		 MULin => MULin,
		 DIVin => DIVin,
		 SRAin => SRAin,
		 SLAin => SLAin,
		 RORin => RORin,
		 ROLin => ROLin,
		 ALU_sel => SYNTHESIZED_WIRE_29);


b2v_bidirectional_bus : bidirectional_bus
PORT MAP(R0out => R0out,
		 R1out => R1out,
		 R2out => R2out,
		 R3out => R3out,
		 R4out => R4out,
		 R5out => R5out,
		 R6out => R6out,
		 R7out => R7out,
		 R8out => R8out,
		 R9out => R9out,
		 R10out => R10out,
		 R11out => R11out,
		 R12out => R12out,
		 R13out => R13out,
		 R14out => R14out,
		 R15out => R15out,
		 PCout => PCout,
		 HIout => HIout,
		 LOout => LOout,
		 Zhighout => Zhighout,
		 Zlowout => Zlowout,
		 MDRout => MDRout,
		 Cout => Cout,
		 InPortout => InPortout,
		 BusMuxIn_HI => SYNTHESIZED_WIRE_3,
		 BusMuxIn_InPort => SYNTHESIZED_WIRE_4,
		 BusMuxIn_LO => SYNTHESIZED_WIRE_5,
		 BusMuxIn_MDR => SYNTHESIZED_WIRE_6,
		 BusMuxIn_PC => SYNTHESIZED_WIRE_7,
		 BusMuxIn_R0in => SYNTHESIZED_WIRE_8,
		 BusMuxIn_R10in => SYNTHESIZED_WIRE_9,
		 BusMuxIn_R11in => SYNTHESIZED_WIRE_10,
		 BusMuxIn_R12in => SYNTHESIZED_WIRE_11,
		 BusMuxIn_R13in => SYNTHESIZED_WIRE_12,
		 BusMuxIn_R14in => SYNTHESIZED_WIRE_13,
		 BusMuxIn_R15in => SYNTHESIZED_WIRE_14,
		 BusMuxIn_R1in => SYNTHESIZED_WIRE_15,
		 BusMuxIn_R2in => SYNTHESIZED_WIRE_16,
		 BusMuxIn_R3in => SYNTHESIZED_WIRE_17,
		 BusMuxIn_R4in => SYNTHESIZED_WIRE_18,
		 BusMuxIn_R5in => SYNTHESIZED_WIRE_19,
		 BusMuxIn_R6in => SYNTHESIZED_WIRE_20,
		 BusMuxIn_R7in => SYNTHESIZED_WIRE_21,
		 BusMuxIn_R8in => SYNTHESIZED_WIRE_22,
		 BusMuxIn_R9in => SYNTHESIZED_WIRE_23,
		 BusMuxIn_Zhigh => SYNTHESIZED_WIRE_24,
		 BusMuxIn_Zlow => SYNTHESIZED_WIRE_25,
		 c_sign_extended => x"00000000",
		 BusMuxOut => SYNTHESIZED_WIRE_1);


b2v_y : y
PORT MAP(clk => clk,
		 clear => clear,
		 Yin => Yin,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 ALUIn_Y => SYNTHESIZED_WIRE_27);


b2v_alu : alu
PORT MAP(alu_A => SYNTHESIZED_WIRE_27,
		 alu_B => SYNTHESIZED_WIRE_1,
		 SEL => SYNTHESIZED_WIRE_29,
		 C_hi => SYNTHESIZED_WIRE_30,
		 C_lo => SYNTHESIZED_WIRE_31);


b2v_z : z
PORT MAP(clk => clk,
		 clear => clear,
		 Zin => Zin,
		 Zhi_in => SYNTHESIZED_WIRE_30,
		 Zlo_in => SYNTHESIZED_WIRE_31,
		 BusMuxIn_Zhi => SYNTHESIZED_WIRE_24,
		 BusMuxIn_Zlow => SYNTHESIZED_WIRE_25);


b2v_IR : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => IRin,
		 d => SYNTHESIZED_WIRE_1,
		 q => IRout);


b2v_LO : lo
PORT MAP(clk => clk,
		 clear => clear,
		 LOin => LOin,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 BusMuxIn_LO => SYNTHESIZED_WIRE_5);


b2v_MAR : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => MARin,
		 d => SYNTHESIZED_WIRE_1,
		 q => MARout);


b2v_MDR : mdr
PORT MAP(clk => clk,
		 clear => clear,
		 MDRin => MDRin,
		 Read => Read,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 MemDataIn => MemDataIn,
		 BusMuxIn_MDR => SYNTHESIZED_WIRE_6,
		 MemIn_MDR => MemDataOut);


b2v_out_port : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => OutPortin,
		 d => SYNTHESIZED_WIRE_1,
		 q => OutPortout);


b2v_PC : pc
PORT MAP(clk => clk,
		 clear => clear,
		 PCin => PCin,
		 IncPC => IncPC,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 BusMuxIn_PC => SYNTHESIZED_WIRE_7);


END bdf_type;