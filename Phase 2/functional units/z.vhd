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
-- CREATED		"Thu Apr 02 18:04:53 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY z IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		clear :  IN  STD_LOGIC;
		Zin :  IN  STD_LOGIC;
		Zhi_in :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Zlo_in :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_Zhi :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxIn_Zlow :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END z;

ARCHITECTURE bdf_type OF z IS 

COMPONENT reg32
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

BEGIN 

b2v_z_hi_reg : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => Zin,
		 d => Zhi_in,
		 q => BusMuxIn_Zhi);

b2v_z_lo_reg : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => Zin,
		 d => Zlo_in,
		 q => BusMuxIn_Zlow);

END bdf_type;