LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY datapath IS 
	PORT
	(
		clk : IN  STD_LOGIC;
		clear : IN  STD_LOGIC;
		HIin : IN  STD_LOGIC;
		LOin : IN  STD_LOGIC;
		Yin : IN  STD_LOGIC;
		PCin : IN  STD_LOGIC;
		IncPC : IN  STD_LOGIC;
		ANDin : IN  STD_LOGIC;
		ORin : IN  STD_LOGIC;
		NOTin : IN  STD_LOGIC;
		NEGin : IN  STD_LOGIC;
		ADDin : IN  STD_LOGIC;
		SUBin : IN  STD_LOGIC;
		MULin : IN  STD_LOGIC;
		DIVin : IN  STD_LOGIC;
		SRAin : IN  STD_LOGIC;
		SLAin : IN  STD_LOGIC;
		RORin : IN  STD_LOGIC;
		ROLin : IN  STD_LOGIC;
		Zin : IN  STD_LOGIC;
		Write : IN  STD_LOGIC;
		Read : IN  STD_LOGIC;
		MDRin : IN  STD_LOGIC;
		MARin : IN  STD_LOGIC;
		OutPortin : IN  STD_LOGIC;
		InPortin : IN  STD_LOGIC;
		PCout : IN  STD_LOGIC;
		HIout : IN  STD_LOGIC;
		LOout : IN  STD_LOGIC;
		Zhighout : IN  STD_LOGIC;
		Zlowout : IN  STD_LOGIC;
		MDRout : IN  STD_LOGIC;
		Cout : IN  STD_LOGIC;
		InPortout : IN  STD_LOGIC;
		IRin :  IN  STD_LOGIC;
		Grb : IN  STD_LOGIC;
		Gra : IN  STD_LOGIC;
		Grc : IN  STD_LOGIC;
		Rin : IN  STD_LOGIC;
		Rout : IN  STD_LOGIC;
		BAout : IN  STD_LOGIC;
		CONin : IN  STD_LOGIC;
		InputDeviceData : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		CONout : OUT  STD_LOGIC;
		BusData : OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		OutputDeviceData : OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END datapath;

ARCHITECTURE bdf_type OF datapath IS 

COMPONENT alu
	PORT(alu_A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 alu_B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 C_hi : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C_lo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
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
		 InPortout : IN STD_LOGIC;
		 Cout : IN STD_LOGIC;
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

COMPONENT conff
	PORT(clk : IN STD_LOGIC;
		 clr : IN STD_LOGIC;
		 CONin : IN STD_LOGIC;
		 BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 IRout : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 CONout : OUT STD_LOGIC
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
		 BAOut : IN STD_LOGIC;
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

COMPONENT ir
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 IRin : IN STD_LOGIC;
		 BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 IROut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
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

COMPONENT mar
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 MARin : IN STD_LOGIC;
		 MemAddrIn : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 MemAddrOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mdr
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 MDRin : IN STD_LOGIC;
		 Read : IN STD_LOGIC;
		 BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 MemDataIn : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 MDRDataOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
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

COMPONENT ram32
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 w_en : IN STD_LOGIC;
		 r_en : IN STD_LOGIC;
		 addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 dataIn : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 dataOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT select_and_encode
	PORT(Gra : IN STD_LOGIC;
		 Grb : IN STD_LOGIC;
		 Grc : IN STD_LOGIC;
		 Rin : IN STD_LOGIC;
		 Rout : IN STD_LOGIC;
		 BAout : IN STD_LOGIC;
		 IRout : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R0out : OUT STD_LOGIC;
		 R1out : OUT STD_LOGIC;
		 R2out : OUT STD_LOGIC;
		 R3out : OUT STD_LOGIC;
		 R4out : OUT STD_LOGIC;
		 R5out : OUT STD_LOGIC;
		 R6out : OUT STD_LOGIC;
		 R7out : OUT STD_LOGIC;
		 R8out : OUT STD_LOGIC;
		 R9out : OUT STD_LOGIC;
		 R10out : OUT STD_LOGIC;
		 R11out : OUT STD_LOGIC;
		 R12out : OUT STD_LOGIC;
		 R13out : OUT STD_LOGIC;
		 R14out : OUT STD_LOGIC;
		 R15out : OUT STD_LOGIC;
		 R0in : OUT STD_LOGIC;
		 R1in : OUT STD_LOGIC;
		 R2in : OUT STD_LOGIC;
		 R3in : OUT STD_LOGIC;
		 R4in : OUT STD_LOGIC;
		 R5in : OUT STD_LOGIC;
		 R6in : OUT STD_LOGIC;
		 R7in : OUT STD_LOGIC;
		 R8in : OUT STD_LOGIC;
		 R9in : OUT STD_LOGIC;
		 R10in : OUT STD_LOGIC;
		 R11in : OUT STD_LOGIC;
		 R12in : OUT STD_LOGIC;
		 R13in : OUT STD_LOGIC;
		 R14in : OUT STD_LOGIC;
		 R15in : OUT STD_LOGIC;
		 c_sign_extended : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
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

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_78 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_46 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_47 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_48 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_49 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_51 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_53 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_54 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_55 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_56 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_57 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_58 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_59 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_60 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_67 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_70 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_74 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_75 :  STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
 
BusData <= SYNTHESIZED_WIRE_1;

b2v_ALU : alu
PORT MAP(alu_A => SYNTHESIZED_WIRE_0,
		 alu_B => SYNTHESIZED_WIRE_1,
		 SEL => SYNTHESIZED_WIRE_2,
		 C_hi => SYNTHESIZED_WIRE_74,
		 C_lo => SYNTHESIZED_WIRE_75);

b2v_ALU_ADDR_ENCODER : alu_addr_encoder
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
		 ALU_sel => SYNTHESIZED_WIRE_2);

b2v_BUS : bidirectional_bus
PORT MAP(R0out => SYNTHESIZED_WIRE_3,
		 R1out => SYNTHESIZED_WIRE_4,
		 R2out => SYNTHESIZED_WIRE_5,
		 R3out => SYNTHESIZED_WIRE_6,
		 R4out => SYNTHESIZED_WIRE_7,
		 R5out => SYNTHESIZED_WIRE_8,
		 R6out => SYNTHESIZED_WIRE_9,
		 R7out => SYNTHESIZED_WIRE_10,
		 R8out => SYNTHESIZED_WIRE_11,
		 R9out => SYNTHESIZED_WIRE_12,
		 R10out => SYNTHESIZED_WIRE_13,
		 R11out => SYNTHESIZED_WIRE_14,
		 R12out => SYNTHESIZED_WIRE_15,
		 R13out => SYNTHESIZED_WIRE_16,
		 R14out => SYNTHESIZED_WIRE_17,
		 R15out => SYNTHESIZED_WIRE_18,
		 PCout => PCout,
		 HIout => HIout,
		 LOout => LOout,
		 Zhighout => Zhighout,
		 Zlowout => Zlowout,
		 MDRout => MDRout,
		 InPortout => InPortout,
		 Cout => Cout,
		 BusMuxIn_HI => SYNTHESIZED_WIRE_19,
		 BusMuxIn_InPort => SYNTHESIZED_WIRE_20,
		 BusMuxIn_LO => SYNTHESIZED_WIRE_21,
		 BusMuxIn_MDR => SYNTHESIZED_WIRE_22,
		 BusMuxIn_PC => SYNTHESIZED_WIRE_23,
		 BusMuxIn_R0in => SYNTHESIZED_WIRE_24,
		 BusMuxIn_R10in => SYNTHESIZED_WIRE_25,
		 BusMuxIn_R11in => SYNTHESIZED_WIRE_26,
		 BusMuxIn_R12in => SYNTHESIZED_WIRE_27,
		 BusMuxIn_R13in => SYNTHESIZED_WIRE_28,
		 BusMuxIn_R14in => SYNTHESIZED_WIRE_29,
		 BusMuxIn_R15in => SYNTHESIZED_WIRE_30,
		 BusMuxIn_R1in => SYNTHESIZED_WIRE_31,
		 BusMuxIn_R2in => SYNTHESIZED_WIRE_32,
		 BusMuxIn_R3in => SYNTHESIZED_WIRE_33,
		 BusMuxIn_R4in => SYNTHESIZED_WIRE_34,
		 BusMuxIn_R5in => SYNTHESIZED_WIRE_35,
		 BusMuxIn_R6in => SYNTHESIZED_WIRE_36,
		 BusMuxIn_R7in => SYNTHESIZED_WIRE_37,
		 BusMuxIn_R8in => SYNTHESIZED_WIRE_38,
		 BusMuxIn_R9in => SYNTHESIZED_WIRE_39,
		 BusMuxIn_Zhigh => SYNTHESIZED_WIRE_40,
		 BusMuxIn_Zlow => SYNTHESIZED_WIRE_41,
		 c_sign_extended => SYNTHESIZED_WIRE_42,
		 BusMuxOut => SYNTHESIZED_WIRE_1);

b2v_CONFF : conff
PORT MAP(clk => clk,
		 clr => clear,
		 CONin => CONin,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 IRout => SYNTHESIZED_WIRE_78,
		 CONout => CONout);

b2v_GP : gp
PORT MAP(clk => clk,
		 clear => clear,
		 R0in => SYNTHESIZED_WIRE_45,
		 R1in => SYNTHESIZED_WIRE_46,
		 R2in => SYNTHESIZED_WIRE_47,
		 R3in => SYNTHESIZED_WIRE_48,
		 R4in => SYNTHESIZED_WIRE_49,
		 R5in => SYNTHESIZED_WIRE_50,
		 R6in => SYNTHESIZED_WIRE_51,
		 R7in => SYNTHESIZED_WIRE_52,
		 R8in => SYNTHESIZED_WIRE_53,
		 R9in => SYNTHESIZED_WIRE_54,
		 R10in => SYNTHESIZED_WIRE_55,
		 R11in => SYNTHESIZED_WIRE_56,
		 R12in => SYNTHESIZED_WIRE_57,
		 R13in => SYNTHESIZED_WIRE_58,
		 R14in => SYNTHESIZED_WIRE_59,
		 R15in => SYNTHESIZED_WIRE_60,
		 BAOut => BAout,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 BusMuxIn_R0in => SYNTHESIZED_WIRE_24,
		 BusMuxIn_R10in => SYNTHESIZED_WIRE_25,
		 BusMuxIn_R11in => SYNTHESIZED_WIRE_26,
		 BusMuxIn_R12in => SYNTHESIZED_WIRE_27,
		 BusMuxIn_R13in => SYNTHESIZED_WIRE_28,
		 BusMuxIn_R14in => SYNTHESIZED_WIRE_29,
		 BusMuxIn_R15in => SYNTHESIZED_WIRE_30,
		 BusMuxIn_R1in => SYNTHESIZED_WIRE_31,
		 BusMuxIn_R2in => SYNTHESIZED_WIRE_32,
		 BusMuxIn_R3in => SYNTHESIZED_WIRE_33,
		 BusMuxIn_R4in => SYNTHESIZED_WIRE_34,
		 BusMuxIn_R5in => SYNTHESIZED_WIRE_35,
		 BusMuxIn_R6in => SYNTHESIZED_WIRE_36,
		 BusMuxIn_R7in => SYNTHESIZED_WIRE_37,
		 BusMuxIn_R8in => SYNTHESIZED_WIRE_38,
		 BusMuxIn_R9in => SYNTHESIZED_WIRE_39);

b2v_HI : hi
PORT MAP(clk => clk,
		 clear => clear,
		 HIin => HIin,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 BusMuxIn_HI => SYNTHESIZED_WIRE_19);

b2v_IN_PORT : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => InPortin,
		 d => InputDeviceData,
		 q => SYNTHESIZED_WIRE_20);

b2v_IR : ir
PORT MAP(clk => clk,
		 clear => clear,
		 IRin => IRin,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 IROut => SYNTHESIZED_WIRE_78);


b2v_LO : lo
PORT MAP(clk => clk,
		 clear => clear,
		 LOin => LOin,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 BusMuxIn_LO => SYNTHESIZED_WIRE_21);

b2v_MAR : mar
PORT MAP(clk => clk,
		 clear => clear,
		 MARin => MARin,
		 MemAddrIn => SYNTHESIZED_WIRE_1,
		 MemAddrOut => SYNTHESIZED_WIRE_70);

b2v_MDR : mdr
PORT MAP(clk => clk,
		 clear => clear,
		 MDRin => MDRin,
		 Read => Read,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 MemDataIn => SYNTHESIZED_WIRE_67,
		 MDRDataOut => SYNTHESIZED_WIRE_22);

b2v_OUT_PORT : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => OutPortin,
		 d => SYNTHESIZED_WIRE_1,
		 q => OutputDeviceData);

b2v_PC : pc
PORT MAP(clk => clk,
		 clear => clear,
		 PCin => PCin,
		 IncPC => IncPC,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 BusMuxIn_PC => SYNTHESIZED_WIRE_23);

b2v_RAM : ram32
PORT MAP(clk => clk,
		 reset_n => clear,
		 w_en => Write,
		 r_en => Read,
		 addr => SYNTHESIZED_WIRE_70,
		 dataIn => SYNTHESIZED_WIRE_22,
		 dataOut => SYNTHESIZED_WIRE_67);

b2v_SELECT_AND_ENCODE : select_and_encode
PORT MAP(Gra => Gra,
		 Grb => Grb,
		 Grc => Grc,
		 Rin => Rin,
		 Rout => Rout,
		 BAout => BAout,
		 IRout => SYNTHESIZED_WIRE_78,
		 R0out => SYNTHESIZED_WIRE_3,
		 R1out => SYNTHESIZED_WIRE_4,
		 R2out => SYNTHESIZED_WIRE_5,
		 R3out => SYNTHESIZED_WIRE_6,
		 R4out => SYNTHESIZED_WIRE_7,
		 R5out => SYNTHESIZED_WIRE_8,
		 R6out => SYNTHESIZED_WIRE_9,
		 R7out => SYNTHESIZED_WIRE_10,
		 R8out => SYNTHESIZED_WIRE_11,
		 R9out => SYNTHESIZED_WIRE_12,
		 R10out => SYNTHESIZED_WIRE_13,
		 R11out => SYNTHESIZED_WIRE_14,
		 R12out => SYNTHESIZED_WIRE_15,
		 R13out => SYNTHESIZED_WIRE_16,
		 R14out => SYNTHESIZED_WIRE_17,
		 R15out => SYNTHESIZED_WIRE_18,
		 R0in => SYNTHESIZED_WIRE_45,
		 R1in => SYNTHESIZED_WIRE_46,
		 R2in => SYNTHESIZED_WIRE_47,
		 R3in => SYNTHESIZED_WIRE_48,
		 R4in => SYNTHESIZED_WIRE_49,
		 R5in => SYNTHESIZED_WIRE_50,
		 R6in => SYNTHESIZED_WIRE_51,
		 R7in => SYNTHESIZED_WIRE_52,
		 R8in => SYNTHESIZED_WIRE_53,
		 R9in => SYNTHESIZED_WIRE_54,
		 R10in => SYNTHESIZED_WIRE_55,
		 R11in => SYNTHESIZED_WIRE_56,
		 R12in => SYNTHESIZED_WIRE_57,
		 R13in => SYNTHESIZED_WIRE_58,
		 R14in => SYNTHESIZED_WIRE_59,
		 R15in => SYNTHESIZED_WIRE_60,
		 c_sign_extended => SYNTHESIZED_WIRE_42);

b2v_Y : y
PORT MAP(clk => clk,
		 clear => clear,
		 Yin => Yin,
		 BusMuxOut => SYNTHESIZED_WIRE_1,
		 ALUIn_Y => SYNTHESIZED_WIRE_0);

b2v_Z : z
PORT MAP(clk => clk,
		 clear => clear,
		 Zin => Zin,
		 Zhi_in => SYNTHESIZED_WIRE_74,
		 Zlo_in => SYNTHESIZED_WIRE_75,
		 BusMuxIn_Zhi => SYNTHESIZED_WIRE_40,
		 BusMuxIn_Zlow => SYNTHESIZED_WIRE_41);

END bdf_type;