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
-- CREATED		"Sat Feb 08 19:52:20 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY gp IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		clear :  IN  STD_LOGIC;
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
		BusMuxOut :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R0in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R1in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R2in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R3in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R4in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R5in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R6in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R7in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R8in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R9in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R10in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R11in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R12in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R13in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R14in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_R15in :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END gp;

ARCHITECTURE bdf_type OF gp IS 

COMPONENT reg32
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R0in,
		 d => BusMuxOut,
		 q => BusMuxIn_R0in);


b2v_inst1 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R1in,
		 d => BusMuxOut,
		 q => BusMuxIn_R1in);


b2v_inst10 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R10in,
		 d => BusMuxOut,
		 q => BusMuxIn_R10in);


b2v_inst11 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R11in,
		 d => BusMuxOut,
		 q => BusMuxIn_R11in);


b2v_inst12 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R12in,
		 d => BusMuxOut,
		 q => BusMuxIn_R12in);


b2v_inst13 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R13in,
		 d => BusMuxOut,
		 q => BusMuxIn_R13in);


b2v_inst14 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R14in,
		 d => BusMuxOut,
		 q => BusMuxIn_R14in);


b2v_inst15 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R15in,
		 d => BusMuxOut,
		 q => BusMuxIn_R15in);


b2v_inst2 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R2in,
		 d => BusMuxOut,
		 q => BusMuxIn_R2in);


b2v_inst3 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R3in,
		 d => BusMuxOut,
		 q => BusMuxIn_R3in);


b2v_inst4 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R4in,
		 d => BusMuxOut,
		 q => BusMuxIn_R4in);


b2v_inst5 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R5in,
		 d => BusMuxOut,
		 q => BusMuxIn_R5in);


b2v_inst6 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R6in,
		 d => BusMuxOut,
		 q => BusMuxIn_R6in);


b2v_inst7 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R7in,
		 d => BusMuxOut,
		 q => BusMuxIn_R7in);


b2v_inst8 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R8in,
		 d => BusMuxOut,
		 q => BusMuxIn_R8in);


b2v_inst9 : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R9in,
		 d => BusMuxOut,
		 q => BusMuxIn_R9in);


END bdf_type;