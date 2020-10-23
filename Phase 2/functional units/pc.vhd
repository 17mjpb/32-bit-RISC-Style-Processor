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
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"
-- CREATED		"Mon Jan 27 10:47:50 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY pc IS 
	PORT
	(
		clk : IN STD_LOGIC;
		clear : IN STD_LOGIC;
		PCin : IN STD_LOGIC;
		IncPC : IN STD_LOGIC;
		BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END pc;

ARCHITECTURE bdf_type OF pc IS 

COMPONENT reg32
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT incrementer
	PORT(input : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2to1_32
	PORT(sel : IN STD_LOGIC;
		 X0_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 X1_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN 
BusMuxIn_PC <= SYNTHESIZED_WIRE_1;

b2v_inst : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => PCin,
		 d => SYNTHESIZED_WIRE_0,
		 q => SYNTHESIZED_WIRE_1);

b2v_inst1 : incrementer
PORT MAP(input => SYNTHESIZED_WIRE_1,
		 output => SYNTHESIZED_WIRE_2);

b2v_inst2 : mux2to1_32
PORT MAP(sel => IncPC,
		 X0_in => BusMuxOut,
		 X1_in => SYNTHESIZED_WIRE_2,
		 Y => SYNTHESIZED_WIRE_0);

END bdf_type;