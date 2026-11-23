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

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "11/13/2026 12:36:19"

-- 
-- Device: Altera EP4CE6F17C8 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	timer_regressivo IS
    PORT (
	clk : IN std_logic;
	btn_start : IN std_logic;
	btn_sec_u : IN std_logic;
	btn_sec_d : IN std_logic;
	btn_min_u : IN std_logic;
	buzzer : BUFFER std_logic;
	sel : BUFFER std_logic_vector(5 DOWNTO 0);
	dig : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END timer_regressivo;

-- Design Ports Information
-- buzzer	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[0]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[1]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[2]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[3]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[4]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[5]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig[0]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig[1]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig[2]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig[3]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig[4]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig[5]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig[6]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig[7]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- btn_min_u	=>  Location: PIN_M15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- btn_sec_u	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- btn_sec_d	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- btn_start	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF timer_regressivo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_btn_start : std_logic;
SIGNAL ww_btn_sec_u : std_logic;
SIGNAL ww_btn_sec_d : std_logic;
SIGNAL ww_btn_min_u : std_logic;
SIGNAL ww_buzzer : std_logic;
SIGNAL ww_sel : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_dig : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \buzzer~output_o\ : std_logic;
SIGNAL \sel[0]~output_o\ : std_logic;
SIGNAL \sel[1]~output_o\ : std_logic;
SIGNAL \sel[2]~output_o\ : std_logic;
SIGNAL \sel[3]~output_o\ : std_logic;
SIGNAL \sel[4]~output_o\ : std_logic;
SIGNAL \sel[5]~output_o\ : std_logic;
SIGNAL \dig[0]~output_o\ : std_logic;
SIGNAL \dig[1]~output_o\ : std_logic;
SIGNAL \dig[2]~output_o\ : std_logic;
SIGNAL \dig[3]~output_o\ : std_logic;
SIGNAL \dig[4]~output_o\ : std_logic;
SIGNAL \dig[5]~output_o\ : std_logic;
SIGNAL \dig[6]~output_o\ : std_logic;
SIGNAL \dig[7]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \beep_timer[0]~26_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \count_1hz[0]~27_combout\ : std_logic;
SIGNAL \LessThan6~5_combout\ : std_logic;
SIGNAL \LessThan6~6_combout\ : std_logic;
SIGNAL \LessThan6~1_combout\ : std_logic;
SIGNAL \LessThan6~0_combout\ : std_logic;
SIGNAL \LessThan6~3_combout\ : std_logic;
SIGNAL \LessThan6~2_combout\ : std_logic;
SIGNAL \LessThan6~4_combout\ : std_logic;
SIGNAL \count_1hz[24]~26_combout\ : std_logic;
SIGNAL \count_1hz[0]~28\ : std_logic;
SIGNAL \count_1hz[1]~29_combout\ : std_logic;
SIGNAL \count_1hz[1]~30\ : std_logic;
SIGNAL \count_1hz[2]~31_combout\ : std_logic;
SIGNAL \count_1hz[2]~32\ : std_logic;
SIGNAL \count_1hz[3]~33_combout\ : std_logic;
SIGNAL \count_1hz[3]~34\ : std_logic;
SIGNAL \count_1hz[4]~35_combout\ : std_logic;
SIGNAL \count_1hz[4]~36\ : std_logic;
SIGNAL \count_1hz[5]~37_combout\ : std_logic;
SIGNAL \count_1hz[5]~38\ : std_logic;
SIGNAL \count_1hz[6]~39_combout\ : std_logic;
SIGNAL \count_1hz[6]~40\ : std_logic;
SIGNAL \count_1hz[7]~41_combout\ : std_logic;
SIGNAL \count_1hz[7]~42\ : std_logic;
SIGNAL \count_1hz[8]~43_combout\ : std_logic;
SIGNAL \count_1hz[8]~44\ : std_logic;
SIGNAL \count_1hz[9]~45_combout\ : std_logic;
SIGNAL \count_1hz[9]~46\ : std_logic;
SIGNAL \count_1hz[10]~47_combout\ : std_logic;
SIGNAL \count_1hz[10]~48\ : std_logic;
SIGNAL \count_1hz[11]~49_combout\ : std_logic;
SIGNAL \count_1hz[11]~50\ : std_logic;
SIGNAL \count_1hz[12]~51_combout\ : std_logic;
SIGNAL \count_1hz[12]~52\ : std_logic;
SIGNAL \count_1hz[13]~53_combout\ : std_logic;
SIGNAL \count_1hz[13]~54\ : std_logic;
SIGNAL \count_1hz[14]~55_combout\ : std_logic;
SIGNAL \count_1hz[14]~56\ : std_logic;
SIGNAL \count_1hz[15]~57_combout\ : std_logic;
SIGNAL \count_1hz[15]~58\ : std_logic;
SIGNAL \count_1hz[16]~59_combout\ : std_logic;
SIGNAL \count_1hz[16]~60\ : std_logic;
SIGNAL \count_1hz[17]~61_combout\ : std_logic;
SIGNAL \count_1hz[17]~62\ : std_logic;
SIGNAL \count_1hz[18]~63_combout\ : std_logic;
SIGNAL \count_1hz[18]~64\ : std_logic;
SIGNAL \count_1hz[19]~65_combout\ : std_logic;
SIGNAL \count_1hz[19]~66\ : std_logic;
SIGNAL \count_1hz[20]~67_combout\ : std_logic;
SIGNAL \count_1hz[20]~68\ : std_logic;
SIGNAL \count_1hz[21]~69_combout\ : std_logic;
SIGNAL \count_1hz[21]~70\ : std_logic;
SIGNAL \count_1hz[22]~71_combout\ : std_logic;
SIGNAL \count_1hz[22]~72\ : std_logic;
SIGNAL \count_1hz[23]~73_combout\ : std_logic;
SIGNAL \count_1hz[23]~74\ : std_logic;
SIGNAL \count_1hz[24]~75_combout\ : std_logic;
SIGNAL \count_1hz[24]~76\ : std_logic;
SIGNAL \count_1hz[25]~77_combout\ : std_logic;
SIGNAL \LessThan6~7_combout\ : std_logic;
SIGNAL \LessThan6~8_combout\ : std_logic;
SIGNAL \LessThan6~9_combout\ : std_logic;
SIGNAL \LessThan6~10_combout\ : std_logic;
SIGNAL \btn_start~input_o\ : std_logic;
SIGNAL \start_sync[0]~0_combout\ : std_logic;
SIGNAL \start_sync[1]~feeder_combout\ : std_logic;
SIGNAL \deb_cnt_start[0]~20_combout\ : std_logic;
SIGNAL \deb_cnt_start[16]~34_combout\ : std_logic;
SIGNAL \deb_cnt_start[0]~21\ : std_logic;
SIGNAL \deb_cnt_start[1]~22_combout\ : std_logic;
SIGNAL \deb_cnt_start[1]~23\ : std_logic;
SIGNAL \deb_cnt_start[2]~24_combout\ : std_logic;
SIGNAL \deb_cnt_start[2]~25\ : std_logic;
SIGNAL \deb_cnt_start[3]~26_combout\ : std_logic;
SIGNAL \deb_cnt_start[3]~27\ : std_logic;
SIGNAL \deb_cnt_start[4]~28_combout\ : std_logic;
SIGNAL \deb_cnt_start[4]~29\ : std_logic;
SIGNAL \deb_cnt_start[5]~30_combout\ : std_logic;
SIGNAL \deb_cnt_start[5]~31\ : std_logic;
SIGNAL \deb_cnt_start[6]~32_combout\ : std_logic;
SIGNAL \deb_cnt_start[6]~33\ : std_logic;
SIGNAL \deb_cnt_start[7]~35_combout\ : std_logic;
SIGNAL \deb_cnt_start[7]~36\ : std_logic;
SIGNAL \deb_cnt_start[8]~37_combout\ : std_logic;
SIGNAL \deb_cnt_start[8]~38\ : std_logic;
SIGNAL \deb_cnt_start[9]~39_combout\ : std_logic;
SIGNAL \deb_cnt_start[9]~40\ : std_logic;
SIGNAL \deb_cnt_start[10]~41_combout\ : std_logic;
SIGNAL \deb_cnt_start[10]~42\ : std_logic;
SIGNAL \deb_cnt_start[11]~43_combout\ : std_logic;
SIGNAL \deb_cnt_start[11]~44\ : std_logic;
SIGNAL \deb_cnt_start[12]~45_combout\ : std_logic;
SIGNAL \deb_cnt_start[12]~46\ : std_logic;
SIGNAL \deb_cnt_start[13]~47_combout\ : std_logic;
SIGNAL \deb_cnt_start[13]~48\ : std_logic;
SIGNAL \deb_cnt_start[14]~49_combout\ : std_logic;
SIGNAL \deb_cnt_start[14]~50\ : std_logic;
SIGNAL \deb_cnt_start[15]~51_combout\ : std_logic;
SIGNAL \deb_cnt_start[15]~52\ : std_logic;
SIGNAL \deb_cnt_start[16]~53_combout\ : std_logic;
SIGNAL \deb_cnt_start[16]~54\ : std_logic;
SIGNAL \deb_cnt_start[17]~55_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \deb_cnt_start[17]~56\ : std_logic;
SIGNAL \deb_cnt_start[18]~57_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \deb_cnt_start[18]~58\ : std_logic;
SIGNAL \deb_cnt_start[19]~59_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \start_stable~0_combout\ : std_logic;
SIGNAL \start_stable~q\ : std_logic;
SIGNAL \start_prev~feeder_combout\ : std_logic;
SIGNAL \start_prev~q\ : std_logic;
SIGNAL \btn_sec_d~input_o\ : std_logic;
SIGNAL \secd_sync[0]~0_combout\ : std_logic;
SIGNAL \secd_sync[1]~feeder_combout\ : std_logic;
SIGNAL \deb_cnt_secd[0]~20_combout\ : std_logic;
SIGNAL \deb_cnt_secd[11]~34_combout\ : std_logic;
SIGNAL \deb_cnt_secd[0]~21\ : std_logic;
SIGNAL \deb_cnt_secd[1]~22_combout\ : std_logic;
SIGNAL \deb_cnt_secd[1]~23\ : std_logic;
SIGNAL \deb_cnt_secd[2]~24_combout\ : std_logic;
SIGNAL \deb_cnt_secd[2]~25\ : std_logic;
SIGNAL \deb_cnt_secd[3]~26_combout\ : std_logic;
SIGNAL \deb_cnt_secd[3]~27\ : std_logic;
SIGNAL \deb_cnt_secd[4]~28_combout\ : std_logic;
SIGNAL \deb_cnt_secd[4]~29\ : std_logic;
SIGNAL \deb_cnt_secd[5]~30_combout\ : std_logic;
SIGNAL \deb_cnt_secd[5]~31\ : std_logic;
SIGNAL \deb_cnt_secd[6]~32_combout\ : std_logic;
SIGNAL \deb_cnt_secd[6]~33\ : std_logic;
SIGNAL \deb_cnt_secd[7]~35_combout\ : std_logic;
SIGNAL \deb_cnt_secd[7]~36\ : std_logic;
SIGNAL \deb_cnt_secd[8]~37_combout\ : std_logic;
SIGNAL \deb_cnt_secd[8]~38\ : std_logic;
SIGNAL \deb_cnt_secd[9]~39_combout\ : std_logic;
SIGNAL \deb_cnt_secd[9]~40\ : std_logic;
SIGNAL \deb_cnt_secd[10]~41_combout\ : std_logic;
SIGNAL \deb_cnt_secd[10]~42\ : std_logic;
SIGNAL \deb_cnt_secd[11]~43_combout\ : std_logic;
SIGNAL \deb_cnt_secd[11]~44\ : std_logic;
SIGNAL \deb_cnt_secd[12]~45_combout\ : std_logic;
SIGNAL \deb_cnt_secd[12]~46\ : std_logic;
SIGNAL \deb_cnt_secd[13]~47_combout\ : std_logic;
SIGNAL \deb_cnt_secd[13]~48\ : std_logic;
SIGNAL \deb_cnt_secd[14]~49_combout\ : std_logic;
SIGNAL \deb_cnt_secd[14]~50\ : std_logic;
SIGNAL \deb_cnt_secd[15]~51_combout\ : std_logic;
SIGNAL \deb_cnt_secd[15]~52\ : std_logic;
SIGNAL \deb_cnt_secd[16]~53_combout\ : std_logic;
SIGNAL \deb_cnt_secd[16]~54\ : std_logic;
SIGNAL \deb_cnt_secd[17]~55_combout\ : std_logic;
SIGNAL \LessThan2~3_combout\ : std_logic;
SIGNAL \deb_cnt_secd[17]~56\ : std_logic;
SIGNAL \deb_cnt_secd[18]~57_combout\ : std_logic;
SIGNAL \deb_cnt_secd[18]~58\ : std_logic;
SIGNAL \deb_cnt_secd[19]~59_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \LessThan2~2_combout\ : std_logic;
SIGNAL \LessThan2~4_combout\ : std_logic;
SIGNAL \secd_stable~0_combout\ : std_logic;
SIGNAL \secd_stable~q\ : std_logic;
SIGNAL \deb_cnt_minu[0]~20_combout\ : std_logic;
SIGNAL \btn_min_u~input_o\ : std_logic;
SIGNAL \minu_sync[0]~0_combout\ : std_logic;
SIGNAL \minu_sync[1]~feeder_combout\ : std_logic;
SIGNAL \deb_cnt_minu[3]~52_combout\ : std_logic;
SIGNAL \deb_cnt_minu[0]~21\ : std_logic;
SIGNAL \deb_cnt_minu[1]~22_combout\ : std_logic;
SIGNAL \deb_cnt_minu[1]~23\ : std_logic;
SIGNAL \deb_cnt_minu[2]~24_combout\ : std_logic;
SIGNAL \deb_cnt_minu[2]~25\ : std_logic;
SIGNAL \deb_cnt_minu[3]~26_combout\ : std_logic;
SIGNAL \deb_cnt_minu[3]~27\ : std_logic;
SIGNAL \deb_cnt_minu[4]~28_combout\ : std_logic;
SIGNAL \deb_cnt_minu[4]~29\ : std_logic;
SIGNAL \deb_cnt_minu[5]~30_combout\ : std_logic;
SIGNAL \deb_cnt_minu[5]~31\ : std_logic;
SIGNAL \deb_cnt_minu[6]~32_combout\ : std_logic;
SIGNAL \deb_cnt_minu[6]~33\ : std_logic;
SIGNAL \deb_cnt_minu[7]~34_combout\ : std_logic;
SIGNAL \deb_cnt_minu[7]~35\ : std_logic;
SIGNAL \deb_cnt_minu[8]~36_combout\ : std_logic;
SIGNAL \deb_cnt_minu[8]~37\ : std_logic;
SIGNAL \deb_cnt_minu[9]~38_combout\ : std_logic;
SIGNAL \deb_cnt_minu[9]~39\ : std_logic;
SIGNAL \deb_cnt_minu[10]~40_combout\ : std_logic;
SIGNAL \deb_cnt_minu[10]~41\ : std_logic;
SIGNAL \deb_cnt_minu[11]~42_combout\ : std_logic;
SIGNAL \deb_cnt_minu[11]~43\ : std_logic;
SIGNAL \deb_cnt_minu[12]~44_combout\ : std_logic;
SIGNAL \deb_cnt_minu[12]~45\ : std_logic;
SIGNAL \deb_cnt_minu[13]~46_combout\ : std_logic;
SIGNAL \deb_cnt_minu[13]~47\ : std_logic;
SIGNAL \deb_cnt_minu[14]~48_combout\ : std_logic;
SIGNAL \deb_cnt_minu[14]~49\ : std_logic;
SIGNAL \deb_cnt_minu[15]~50_combout\ : std_logic;
SIGNAL \deb_cnt_minu[15]~51\ : std_logic;
SIGNAL \deb_cnt_minu[16]~53_combout\ : std_logic;
SIGNAL \deb_cnt_minu[16]~54\ : std_logic;
SIGNAL \deb_cnt_minu[17]~55_combout\ : std_logic;
SIGNAL \deb_cnt_minu[17]~56\ : std_logic;
SIGNAL \deb_cnt_minu[18]~57_combout\ : std_logic;
SIGNAL \deb_cnt_minu[18]~58\ : std_logic;
SIGNAL \deb_cnt_minu[19]~59_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \LessThan3~3_combout\ : std_logic;
SIGNAL \LessThan3~4_combout\ : std_logic;
SIGNAL \minu_stable~0_combout\ : std_logic;
SIGNAL \minu_stable~q\ : std_logic;
SIGNAL \minu_prev~q\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \min_uni[0]~7_combout\ : std_logic;
SIGNAL \min_uni[0]~8_combout\ : std_logic;
SIGNAL \min_uni[0]~9_combout\ : std_logic;
SIGNAL \min_uni[1]~0_combout\ : std_logic;
SIGNAL \min_uni[1]~1_combout\ : std_logic;
SIGNAL \min_uni[2]~5_combout\ : std_logic;
SIGNAL \min_uni[2]~6_combout\ : std_logic;
SIGNAL \min_uni[3]~2_combout\ : std_logic;
SIGNAL \min_uni[3]~3_combout\ : std_logic;
SIGNAL \min_uni[3]~4_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \min_uni[1]~10_combout\ : std_logic;
SIGNAL \min_uni[1]~11_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \sec_dez[0]~0_combout\ : std_logic;
SIGNAL \sec_dez[0]~1_combout\ : std_logic;
SIGNAL \secd_prev~feeder_combout\ : std_logic;
SIGNAL \secd_prev~q\ : std_logic;
SIGNAL \sec_dez~2_combout\ : std_logic;
SIGNAL \sec_dez[0]~3_combout\ : std_logic;
SIGNAL \sec_dez[1]~4_combout\ : std_logic;
SIGNAL \sec_dez[1]~5_combout\ : std_logic;
SIGNAL \process_0~2_combout\ : std_logic;
SIGNAL \sec_dez[1]~6_combout\ : std_logic;
SIGNAL \sec_dez[1]~7_combout\ : std_logic;
SIGNAL \sec_dez[2]~8_combout\ : std_logic;
SIGNAL \sec_dez[2]~9_combout\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \btn_sec_u~input_o\ : std_logic;
SIGNAL \secu_sync[0]~0_combout\ : std_logic;
SIGNAL \secu_sync[1]~feeder_combout\ : std_logic;
SIGNAL \deb_cnt_secu[0]~20_combout\ : std_logic;
SIGNAL \deb_cnt_secu[12]~52_combout\ : std_logic;
SIGNAL \deb_cnt_secu[0]~21\ : std_logic;
SIGNAL \deb_cnt_secu[1]~22_combout\ : std_logic;
SIGNAL \deb_cnt_secu[1]~23\ : std_logic;
SIGNAL \deb_cnt_secu[2]~24_combout\ : std_logic;
SIGNAL \deb_cnt_secu[2]~25\ : std_logic;
SIGNAL \deb_cnt_secu[3]~26_combout\ : std_logic;
SIGNAL \deb_cnt_secu[3]~27\ : std_logic;
SIGNAL \deb_cnt_secu[4]~28_combout\ : std_logic;
SIGNAL \deb_cnt_secu[4]~29\ : std_logic;
SIGNAL \deb_cnt_secu[5]~30_combout\ : std_logic;
SIGNAL \deb_cnt_secu[5]~31\ : std_logic;
SIGNAL \deb_cnt_secu[6]~32_combout\ : std_logic;
SIGNAL \deb_cnt_secu[6]~33\ : std_logic;
SIGNAL \deb_cnt_secu[7]~34_combout\ : std_logic;
SIGNAL \deb_cnt_secu[7]~35\ : std_logic;
SIGNAL \deb_cnt_secu[8]~36_combout\ : std_logic;
SIGNAL \deb_cnt_secu[8]~37\ : std_logic;
SIGNAL \deb_cnt_secu[9]~38_combout\ : std_logic;
SIGNAL \deb_cnt_secu[9]~39\ : std_logic;
SIGNAL \deb_cnt_secu[10]~40_combout\ : std_logic;
SIGNAL \deb_cnt_secu[10]~41\ : std_logic;
SIGNAL \deb_cnt_secu[11]~42_combout\ : std_logic;
SIGNAL \deb_cnt_secu[11]~43\ : std_logic;
SIGNAL \deb_cnt_secu[12]~44_combout\ : std_logic;
SIGNAL \deb_cnt_secu[12]~45\ : std_logic;
SIGNAL \deb_cnt_secu[13]~46_combout\ : std_logic;
SIGNAL \deb_cnt_secu[13]~47\ : std_logic;
SIGNAL \deb_cnt_secu[14]~48_combout\ : std_logic;
SIGNAL \deb_cnt_secu[14]~49\ : std_logic;
SIGNAL \deb_cnt_secu[15]~50_combout\ : std_logic;
SIGNAL \deb_cnt_secu[15]~51\ : std_logic;
SIGNAL \deb_cnt_secu[16]~53_combout\ : std_logic;
SIGNAL \deb_cnt_secu[16]~54\ : std_logic;
SIGNAL \deb_cnt_secu[17]~55_combout\ : std_logic;
SIGNAL \deb_cnt_secu[17]~56\ : std_logic;
SIGNAL \deb_cnt_secu[18]~57_combout\ : std_logic;
SIGNAL \deb_cnt_secu[18]~58\ : std_logic;
SIGNAL \deb_cnt_secu[19]~59_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \secu_stable~0_combout\ : std_logic;
SIGNAL \secu_stable~q\ : std_logic;
SIGNAL \secu_prev~q\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \sec_uni[1]~1_combout\ : std_logic;
SIGNAL \sec_uni[1]~5_combout\ : std_logic;
SIGNAL \process_0~4_combout\ : std_logic;
SIGNAL \sec_uni[1]~6_combout\ : std_logic;
SIGNAL \sec_uni[1]~7_combout\ : std_logic;
SIGNAL \sec_uni[2]~9_combout\ : std_logic;
SIGNAL \sec_uni[2]~8_combout\ : std_logic;
SIGNAL \sec_uni[2]~10_combout\ : std_logic;
SIGNAL \sec_uni[2]~11_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \sec_uni[3]~0_combout\ : std_logic;
SIGNAL \sec_uni[3]~2_combout\ : std_logic;
SIGNAL \sec_uni[3]~3_combout\ : std_logic;
SIGNAL \sec_uni[3]~4_combout\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \alarm~2_combout\ : std_logic;
SIGNAL \alarm~0_combout\ : std_logic;
SIGNAL \alarm~1_combout\ : std_logic;
SIGNAL \alarm~3_combout\ : std_logic;
SIGNAL \alarm~q\ : std_logic;
SIGNAL \running~1_combout\ : std_logic;
SIGNAL \process_0~5_combout\ : std_logic;
SIGNAL \running~2_combout\ : std_logic;
SIGNAL \running~3_combout\ : std_logic;
SIGNAL \running~0_combout\ : std_logic;
SIGNAL \running~q\ : std_logic;
SIGNAL \sec_uni~12_combout\ : std_logic;
SIGNAL \sec_uni[0]~13_combout\ : std_logic;
SIGNAL \Equal5~1_combout\ : std_logic;
SIGNAL \process_0~3_combout\ : std_logic;
SIGNAL \beep_timer[14]~28_combout\ : std_logic;
SIGNAL \beep_timer[14]~29_combout\ : std_logic;
SIGNAL \beep_timer[0]~27\ : std_logic;
SIGNAL \beep_timer[1]~30_combout\ : std_logic;
SIGNAL \beep_timer[1]~31\ : std_logic;
SIGNAL \beep_timer[2]~32_combout\ : std_logic;
SIGNAL \beep_timer[2]~33\ : std_logic;
SIGNAL \beep_timer[3]~34_combout\ : std_logic;
SIGNAL \beep_timer[3]~35\ : std_logic;
SIGNAL \beep_timer[4]~36_combout\ : std_logic;
SIGNAL \beep_timer[4]~37\ : std_logic;
SIGNAL \beep_timer[5]~38_combout\ : std_logic;
SIGNAL \beep_timer[5]~39\ : std_logic;
SIGNAL \beep_timer[6]~40_combout\ : std_logic;
SIGNAL \beep_timer[6]~41\ : std_logic;
SIGNAL \beep_timer[7]~42_combout\ : std_logic;
SIGNAL \beep_timer[7]~43\ : std_logic;
SIGNAL \beep_timer[8]~44_combout\ : std_logic;
SIGNAL \beep_timer[8]~45\ : std_logic;
SIGNAL \beep_timer[9]~46_combout\ : std_logic;
SIGNAL \beep_timer[9]~47\ : std_logic;
SIGNAL \beep_timer[10]~48_combout\ : std_logic;
SIGNAL \beep_timer[10]~49\ : std_logic;
SIGNAL \beep_timer[11]~50_combout\ : std_logic;
SIGNAL \beep_timer[11]~51\ : std_logic;
SIGNAL \beep_timer[12]~52_combout\ : std_logic;
SIGNAL \beep_timer[12]~53\ : std_logic;
SIGNAL \beep_timer[13]~54_combout\ : std_logic;
SIGNAL \beep_timer[13]~55\ : std_logic;
SIGNAL \beep_timer[14]~56_combout\ : std_logic;
SIGNAL \beep_timer[14]~57\ : std_logic;
SIGNAL \beep_timer[15]~58_combout\ : std_logic;
SIGNAL \beep_timer[15]~59\ : std_logic;
SIGNAL \beep_timer[16]~60_combout\ : std_logic;
SIGNAL \beep_timer[16]~61\ : std_logic;
SIGNAL \beep_timer[17]~62_combout\ : std_logic;
SIGNAL \beep_timer[17]~63\ : std_logic;
SIGNAL \beep_timer[18]~64_combout\ : std_logic;
SIGNAL \beep_timer[18]~65\ : std_logic;
SIGNAL \beep_timer[19]~66_combout\ : std_logic;
SIGNAL \beep_timer[19]~67\ : std_logic;
SIGNAL \beep_timer[20]~68_combout\ : std_logic;
SIGNAL \beep_timer[20]~69\ : std_logic;
SIGNAL \beep_timer[21]~70_combout\ : std_logic;
SIGNAL \beep_timer[21]~71\ : std_logic;
SIGNAL \beep_timer[22]~72_combout\ : std_logic;
SIGNAL \beep_timer[22]~73\ : std_logic;
SIGNAL \beep_timer[23]~74_combout\ : std_logic;
SIGNAL \beep_timer[23]~75\ : std_logic;
SIGNAL \beep_timer[24]~76_combout\ : std_logic;
SIGNAL \beep_timer[24]~77\ : std_logic;
SIGNAL \beep_timer[25]~78_combout\ : std_logic;
SIGNAL \LessThan9~7_combout\ : std_logic;
SIGNAL \LessThan9~5_combout\ : std_logic;
SIGNAL \LessThan9~0_combout\ : std_logic;
SIGNAL \LessThan9~2_combout\ : std_logic;
SIGNAL \LessThan9~3_combout\ : std_logic;
SIGNAL \LessThan9~1_combout\ : std_logic;
SIGNAL \LessThan9~4_combout\ : std_logic;
SIGNAL \LessThan9~6_combout\ : std_logic;
SIGNAL \LessThan9~8_combout\ : std_logic;
SIGNAL \alarm_cnt[0]~26_combout\ : std_logic;
SIGNAL \alarm_cnt[23]~75\ : std_logic;
SIGNAL \alarm_cnt[24]~76_combout\ : std_logic;
SIGNAL \alarm_cnt[24]~77\ : std_logic;
SIGNAL \alarm_cnt[25]~78_combout\ : std_logic;
SIGNAL \alarm_cnt[0]~68_combout\ : std_logic;
SIGNAL \LessThan8~7_combout\ : std_logic;
SIGNAL \LessThan8~8_combout\ : std_logic;
SIGNAL \LessThan8~0_combout\ : std_logic;
SIGNAL \LessThan8~2_combout\ : std_logic;
SIGNAL \LessThan8~5_combout\ : std_logic;
SIGNAL \LessThan8~4_combout\ : std_logic;
SIGNAL \LessThan8~3_combout\ : std_logic;
SIGNAL \LessThan8~6_combout\ : std_logic;
SIGNAL \LessThan8~1_combout\ : std_logic;
SIGNAL \LessThan8~9_combout\ : std_logic;
SIGNAL \alarm_cnt[0]~69_combout\ : std_logic;
SIGNAL \alarm_cnt[0]~27\ : std_logic;
SIGNAL \alarm_cnt[1]~28_combout\ : std_logic;
SIGNAL \alarm_cnt[1]~29\ : std_logic;
SIGNAL \alarm_cnt[2]~30_combout\ : std_logic;
SIGNAL \alarm_cnt[2]~31\ : std_logic;
SIGNAL \alarm_cnt[3]~32_combout\ : std_logic;
SIGNAL \alarm_cnt[3]~33\ : std_logic;
SIGNAL \alarm_cnt[4]~34_combout\ : std_logic;
SIGNAL \alarm_cnt[4]~35\ : std_logic;
SIGNAL \alarm_cnt[5]~36_combout\ : std_logic;
SIGNAL \alarm_cnt[5]~37\ : std_logic;
SIGNAL \alarm_cnt[6]~38_combout\ : std_logic;
SIGNAL \alarm_cnt[6]~39\ : std_logic;
SIGNAL \alarm_cnt[7]~40_combout\ : std_logic;
SIGNAL \alarm_cnt[7]~41\ : std_logic;
SIGNAL \alarm_cnt[8]~42_combout\ : std_logic;
SIGNAL \alarm_cnt[8]~43\ : std_logic;
SIGNAL \alarm_cnt[9]~44_combout\ : std_logic;
SIGNAL \alarm_cnt[9]~45\ : std_logic;
SIGNAL \alarm_cnt[10]~46_combout\ : std_logic;
SIGNAL \alarm_cnt[10]~47\ : std_logic;
SIGNAL \alarm_cnt[11]~48_combout\ : std_logic;
SIGNAL \alarm_cnt[11]~49\ : std_logic;
SIGNAL \alarm_cnt[12]~50_combout\ : std_logic;
SIGNAL \alarm_cnt[12]~51\ : std_logic;
SIGNAL \alarm_cnt[13]~52_combout\ : std_logic;
SIGNAL \alarm_cnt[13]~53\ : std_logic;
SIGNAL \alarm_cnt[14]~54_combout\ : std_logic;
SIGNAL \alarm_cnt[14]~55\ : std_logic;
SIGNAL \alarm_cnt[15]~56_combout\ : std_logic;
SIGNAL \alarm_cnt[15]~57\ : std_logic;
SIGNAL \alarm_cnt[16]~58_combout\ : std_logic;
SIGNAL \alarm_cnt[16]~59\ : std_logic;
SIGNAL \alarm_cnt[17]~60_combout\ : std_logic;
SIGNAL \alarm_cnt[17]~61\ : std_logic;
SIGNAL \alarm_cnt[18]~62_combout\ : std_logic;
SIGNAL \alarm_cnt[18]~63\ : std_logic;
SIGNAL \alarm_cnt[19]~64_combout\ : std_logic;
SIGNAL \alarm_cnt[19]~65\ : std_logic;
SIGNAL \alarm_cnt[20]~66_combout\ : std_logic;
SIGNAL \alarm_cnt[20]~67\ : std_logic;
SIGNAL \alarm_cnt[21]~70_combout\ : std_logic;
SIGNAL \alarm_cnt[21]~71\ : std_logic;
SIGNAL \alarm_cnt[22]~72_combout\ : std_logic;
SIGNAL \alarm_cnt[22]~73\ : std_logic;
SIGNAL \alarm_cnt[23]~74_combout\ : std_logic;
SIGNAL \LessThan8~10_combout\ : std_logic;
SIGNAL \alarm_toggle~0_combout\ : std_logic;
SIGNAL \alarm_toggle~q\ : std_logic;
SIGNAL \buzzer~0_combout\ : std_logic;
SIGNAL \mux_sel[0]~2_combout\ : std_logic;
SIGNAL \count_mux[0]~16_combout\ : std_logic;
SIGNAL \count_mux[0]~17\ : std_logic;
SIGNAL \count_mux[1]~18_combout\ : std_logic;
SIGNAL \count_mux[1]~19\ : std_logic;
SIGNAL \count_mux[2]~20_combout\ : std_logic;
SIGNAL \count_mux[2]~21\ : std_logic;
SIGNAL \count_mux[3]~22_combout\ : std_logic;
SIGNAL \count_mux[3]~23\ : std_logic;
SIGNAL \count_mux[4]~24_combout\ : std_logic;
SIGNAL \count_mux[4]~25\ : std_logic;
SIGNAL \count_mux[5]~26_combout\ : std_logic;
SIGNAL \count_mux[5]~27\ : std_logic;
SIGNAL \count_mux[6]~28_combout\ : std_logic;
SIGNAL \count_mux[6]~29\ : std_logic;
SIGNAL \count_mux[7]~30_combout\ : std_logic;
SIGNAL \count_mux[7]~31\ : std_logic;
SIGNAL \count_mux[8]~32_combout\ : std_logic;
SIGNAL \count_mux[8]~33\ : std_logic;
SIGNAL \count_mux[9]~34_combout\ : std_logic;
SIGNAL \count_mux[9]~35\ : std_logic;
SIGNAL \count_mux[10]~36_combout\ : std_logic;
SIGNAL \count_mux[10]~37\ : std_logic;
SIGNAL \count_mux[11]~38_combout\ : std_logic;
SIGNAL \count_mux[11]~39\ : std_logic;
SIGNAL \count_mux[12]~40_combout\ : std_logic;
SIGNAL \count_mux[12]~41\ : std_logic;
SIGNAL \count_mux[13]~42_combout\ : std_logic;
SIGNAL \LessThan10~3_combout\ : std_logic;
SIGNAL \count_mux[13]~43\ : std_logic;
SIGNAL \count_mux[14]~44_combout\ : std_logic;
SIGNAL \count_mux[14]~45\ : std_logic;
SIGNAL \count_mux[15]~46_combout\ : std_logic;
SIGNAL \LessThan10~0_combout\ : std_logic;
SIGNAL \LessThan10~1_combout\ : std_logic;
SIGNAL \LessThan10~2_combout\ : std_logic;
SIGNAL \LessThan10~4_combout\ : std_logic;
SIGNAL \mux_sel~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \sel[0]~reg0feeder_combout\ : std_logic;
SIGNAL \sel[0]~reg0_q\ : std_logic;
SIGNAL \sel[1]~0_combout\ : std_logic;
SIGNAL \sel[1]~reg0_q\ : std_logic;
SIGNAL \sel[2]~1_combout\ : std_logic;
SIGNAL \sel[2]~reg0_q\ : std_logic;
SIGNAL \current_bcd[2]~2_combout\ : std_logic;
SIGNAL \current_bcd[0]~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \current_bcd[1]~1_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \dp~feeder_combout\ : std_logic;
SIGNAL \dp~q\ : std_logic;
SIGNAL start_sync : std_logic_vector(1 DOWNTO 0);
SIGNAL secu_sync : std_logic_vector(1 DOWNTO 0);
SIGNAL secd_sync : std_logic_vector(1 DOWNTO 0);
SIGNAL sec_uni : std_logic_vector(3 DOWNTO 0);
SIGNAL sec_dez : std_logic_vector(2 DOWNTO 0);
SIGNAL mux_sel : std_logic_vector(1 DOWNTO 0);
SIGNAL minu_sync : std_logic_vector(1 DOWNTO 0);
SIGNAL min_uni : std_logic_vector(3 DOWNTO 0);
SIGNAL deb_cnt_start : std_logic_vector(19 DOWNTO 0);
SIGNAL deb_cnt_secu : std_logic_vector(19 DOWNTO 0);
SIGNAL deb_cnt_secd : std_logic_vector(19 DOWNTO 0);
SIGNAL deb_cnt_minu : std_logic_vector(19 DOWNTO 0);
SIGNAL current_bcd : std_logic_vector(3 DOWNTO 0);
SIGNAL count_mux : std_logic_vector(15 DOWNTO 0);
SIGNAL count_1hz : std_logic_vector(25 DOWNTO 0);
SIGNAL beep_timer : std_logic_vector(25 DOWNTO 0);
SIGNAL alarm_cnt : std_logic_vector(25 DOWNTO 0);
SIGNAL \ALT_INV_count_1hz[24]~26_combout\ : std_logic;
SIGNAL \ALT_INV_dp~q\ : std_logic;
SIGNAL \ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \ALT_INV_running~q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_btn_start <= btn_start;
ww_btn_sec_u <= btn_sec_u;
ww_btn_sec_d <= btn_sec_d;
ww_btn_min_u <= btn_min_u;
buzzer <= ww_buzzer;
sel <= ww_sel;
dig <= ww_dig;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_count_1hz[24]~26_combout\ <= NOT \count_1hz[24]~26_combout\;
\ALT_INV_dp~q\ <= NOT \dp~q\;
\ALT_INV_Mux5~0_combout\ <= NOT \Mux5~0_combout\;
\ALT_INV_running~q\ <= NOT \running~q\;

-- Location: IOOBUF_X23_Y24_N2
\buzzer~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \buzzer~0_combout\,
	devoe => ww_devoe,
	o => \buzzer~output_o\);

-- Location: IOOBUF_X32_Y0_N9
\sel[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sel[0]~reg0_q\,
	devoe => ww_devoe,
	o => \sel[0]~output_o\);

-- Location: IOOBUF_X28_Y0_N23
\sel[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sel[1]~reg0_q\,
	devoe => ww_devoe,
	o => \sel[1]~output_o\);

-- Location: IOOBUF_X30_Y0_N23
\sel[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sel[2]~reg0_q\,
	devoe => ww_devoe,
	o => \sel[2]~output_o\);

-- Location: IOOBUF_X28_Y0_N2
\sel[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sel[3]~output_o\);

-- Location: IOOBUF_X25_Y0_N2
\sel[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sel[4]~output_o\);

-- Location: IOOBUF_X21_Y0_N16
\sel[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sel[5]~output_o\);

-- Location: IOOBUF_X30_Y0_N2
\dig[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux11~0_combout\,
	devoe => ww_devoe,
	o => \dig[0]~output_o\);

-- Location: IOOBUF_X34_Y7_N23
\dig[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux10~0_combout\,
	devoe => ww_devoe,
	o => \dig[1]~output_o\);

-- Location: IOOBUF_X34_Y5_N23
\dig[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux9~0_combout\,
	devoe => ww_devoe,
	o => \dig[2]~output_o\);

-- Location: IOOBUF_X30_Y0_N9
\dig[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux8~0_combout\,
	devoe => ww_devoe,
	o => \dig[3]~output_o\);

-- Location: IOOBUF_X34_Y4_N16
\dig[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~0_combout\,
	devoe => ww_devoe,
	o => \dig[4]~output_o\);

-- Location: IOOBUF_X32_Y0_N2
\dig[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => \dig[5]~output_o\);

-- Location: IOOBUF_X34_Y7_N16
\dig[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \dig[6]~output_o\);

-- Location: IOOBUF_X34_Y5_N16
\dig[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_dp~q\,
	devoe => ww_devoe,
	o => \dig[7]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X30_Y11_N6
\beep_timer[0]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[0]~26_combout\ = beep_timer(0) $ (VCC)
-- \beep_timer[0]~27\ = CARRY(beep_timer(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(0),
	datad => VCC,
	combout => \beep_timer[0]~26_combout\,
	cout => \beep_timer[0]~27\);

-- Location: LCCOMB_X31_Y10_N0
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X28_Y11_N6
\count_1hz[0]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[0]~27_combout\ = count_1hz(0) $ (VCC)
-- \count_1hz[0]~28\ = CARRY(count_1hz(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(0),
	datad => VCC,
	combout => \count_1hz[0]~27_combout\,
	cout => \count_1hz[0]~28\);

-- Location: LCCOMB_X29_Y10_N12
\LessThan6~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~5_combout\ = (((!count_1hz(14)) # (!count_1hz(12))) # (!count_1hz(15))) # (!count_1hz(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(13),
	datab => count_1hz(15),
	datac => count_1hz(12),
	datad => count_1hz(14),
	combout => \LessThan6~5_combout\);

-- Location: LCCOMB_X29_Y10_N26
\LessThan6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~6_combout\ = (!count_1hz(18) & (!count_1hz(24) & (!count_1hz(16) & \LessThan6~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(18),
	datab => count_1hz(24),
	datac => count_1hz(16),
	datad => \LessThan6~5_combout\,
	combout => \LessThan6~6_combout\);

-- Location: LCCOMB_X28_Y11_N4
\LessThan6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~1_combout\ = (!count_1hz(10) & (!count_1hz(11) & (!count_1hz(8) & !count_1hz(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(10),
	datab => count_1hz(11),
	datac => count_1hz(8),
	datad => count_1hz(9),
	combout => \LessThan6~1_combout\);

-- Location: LCCOMB_X29_Y10_N16
\LessThan6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~0_combout\ = (!count_1hz(18) & (!count_1hz(24) & (!count_1hz(16) & !count_1hz(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(18),
	datab => count_1hz(24),
	datac => count_1hz(16),
	datad => count_1hz(7),
	combout => \LessThan6~0_combout\);

-- Location: LCCOMB_X28_Y11_N0
\LessThan6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~3_combout\ = ((!count_1hz(5)) # (!count_1hz(4))) # (!count_1hz(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(6),
	datac => count_1hz(4),
	datad => count_1hz(5),
	combout => \LessThan6~3_combout\);

-- Location: LCCOMB_X28_Y11_N2
\LessThan6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~2_combout\ = (((!count_1hz(2)) # (!count_1hz(3))) # (!count_1hz(1))) # (!count_1hz(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(0),
	datab => count_1hz(1),
	datac => count_1hz(3),
	datad => count_1hz(2),
	combout => \LessThan6~2_combout\);

-- Location: LCCOMB_X29_Y10_N6
\LessThan6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~4_combout\ = (\LessThan6~1_combout\ & (\LessThan6~0_combout\ & ((\LessThan6~3_combout\) # (\LessThan6~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan6~1_combout\,
	datab => \LessThan6~0_combout\,
	datac => \LessThan6~3_combout\,
	datad => \LessThan6~2_combout\,
	combout => \LessThan6~4_combout\);

-- Location: LCCOMB_X29_Y10_N20
\count_1hz[24]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[24]~26_combout\ = (\running~q\ & ((\LessThan6~9_combout\) # ((\LessThan6~6_combout\) # (\LessThan6~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan6~9_combout\,
	datab => \running~q\,
	datac => \LessThan6~6_combout\,
	datad => \LessThan6~4_combout\,
	combout => \count_1hz[24]~26_combout\);

-- Location: FF_X28_Y11_N7
\count_1hz[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[0]~27_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(0));

-- Location: LCCOMB_X28_Y11_N8
\count_1hz[1]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[1]~29_combout\ = (count_1hz(1) & (!\count_1hz[0]~28\)) # (!count_1hz(1) & ((\count_1hz[0]~28\) # (GND)))
-- \count_1hz[1]~30\ = CARRY((!\count_1hz[0]~28\) # (!count_1hz(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(1),
	datad => VCC,
	cin => \count_1hz[0]~28\,
	combout => \count_1hz[1]~29_combout\,
	cout => \count_1hz[1]~30\);

-- Location: FF_X28_Y11_N9
\count_1hz[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[1]~29_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(1));

-- Location: LCCOMB_X28_Y11_N10
\count_1hz[2]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[2]~31_combout\ = (count_1hz(2) & (\count_1hz[1]~30\ $ (GND))) # (!count_1hz(2) & (!\count_1hz[1]~30\ & VCC))
-- \count_1hz[2]~32\ = CARRY((count_1hz(2) & !\count_1hz[1]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(2),
	datad => VCC,
	cin => \count_1hz[1]~30\,
	combout => \count_1hz[2]~31_combout\,
	cout => \count_1hz[2]~32\);

-- Location: FF_X28_Y11_N11
\count_1hz[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[2]~31_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(2));

-- Location: LCCOMB_X28_Y11_N12
\count_1hz[3]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[3]~33_combout\ = (count_1hz(3) & (!\count_1hz[2]~32\)) # (!count_1hz(3) & ((\count_1hz[2]~32\) # (GND)))
-- \count_1hz[3]~34\ = CARRY((!\count_1hz[2]~32\) # (!count_1hz(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(3),
	datad => VCC,
	cin => \count_1hz[2]~32\,
	combout => \count_1hz[3]~33_combout\,
	cout => \count_1hz[3]~34\);

-- Location: FF_X28_Y11_N13
\count_1hz[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[3]~33_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(3));

-- Location: LCCOMB_X28_Y11_N14
\count_1hz[4]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[4]~35_combout\ = (count_1hz(4) & (\count_1hz[3]~34\ $ (GND))) # (!count_1hz(4) & (!\count_1hz[3]~34\ & VCC))
-- \count_1hz[4]~36\ = CARRY((count_1hz(4) & !\count_1hz[3]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(4),
	datad => VCC,
	cin => \count_1hz[3]~34\,
	combout => \count_1hz[4]~35_combout\,
	cout => \count_1hz[4]~36\);

-- Location: FF_X28_Y11_N15
\count_1hz[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[4]~35_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(4));

-- Location: LCCOMB_X28_Y11_N16
\count_1hz[5]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[5]~37_combout\ = (count_1hz(5) & (!\count_1hz[4]~36\)) # (!count_1hz(5) & ((\count_1hz[4]~36\) # (GND)))
-- \count_1hz[5]~38\ = CARRY((!\count_1hz[4]~36\) # (!count_1hz(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(5),
	datad => VCC,
	cin => \count_1hz[4]~36\,
	combout => \count_1hz[5]~37_combout\,
	cout => \count_1hz[5]~38\);

-- Location: FF_X28_Y11_N17
\count_1hz[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[5]~37_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(5));

-- Location: LCCOMB_X28_Y11_N18
\count_1hz[6]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[6]~39_combout\ = (count_1hz(6) & (\count_1hz[5]~38\ $ (GND))) # (!count_1hz(6) & (!\count_1hz[5]~38\ & VCC))
-- \count_1hz[6]~40\ = CARRY((count_1hz(6) & !\count_1hz[5]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(6),
	datad => VCC,
	cin => \count_1hz[5]~38\,
	combout => \count_1hz[6]~39_combout\,
	cout => \count_1hz[6]~40\);

-- Location: FF_X28_Y11_N19
\count_1hz[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[6]~39_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(6));

-- Location: LCCOMB_X28_Y11_N20
\count_1hz[7]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[7]~41_combout\ = (count_1hz(7) & (!\count_1hz[6]~40\)) # (!count_1hz(7) & ((\count_1hz[6]~40\) # (GND)))
-- \count_1hz[7]~42\ = CARRY((!\count_1hz[6]~40\) # (!count_1hz(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(7),
	datad => VCC,
	cin => \count_1hz[6]~40\,
	combout => \count_1hz[7]~41_combout\,
	cout => \count_1hz[7]~42\);

-- Location: FF_X28_Y11_N21
\count_1hz[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[7]~41_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(7));

-- Location: LCCOMB_X28_Y11_N22
\count_1hz[8]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[8]~43_combout\ = (count_1hz(8) & (\count_1hz[7]~42\ $ (GND))) # (!count_1hz(8) & (!\count_1hz[7]~42\ & VCC))
-- \count_1hz[8]~44\ = CARRY((count_1hz(8) & !\count_1hz[7]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(8),
	datad => VCC,
	cin => \count_1hz[7]~42\,
	combout => \count_1hz[8]~43_combout\,
	cout => \count_1hz[8]~44\);

-- Location: FF_X28_Y11_N23
\count_1hz[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[8]~43_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(8));

-- Location: LCCOMB_X28_Y11_N24
\count_1hz[9]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[9]~45_combout\ = (count_1hz(9) & (!\count_1hz[8]~44\)) # (!count_1hz(9) & ((\count_1hz[8]~44\) # (GND)))
-- \count_1hz[9]~46\ = CARRY((!\count_1hz[8]~44\) # (!count_1hz(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(9),
	datad => VCC,
	cin => \count_1hz[8]~44\,
	combout => \count_1hz[9]~45_combout\,
	cout => \count_1hz[9]~46\);

-- Location: FF_X28_Y11_N25
\count_1hz[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[9]~45_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(9));

-- Location: LCCOMB_X28_Y11_N26
\count_1hz[10]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[10]~47_combout\ = (count_1hz(10) & (\count_1hz[9]~46\ $ (GND))) # (!count_1hz(10) & (!\count_1hz[9]~46\ & VCC))
-- \count_1hz[10]~48\ = CARRY((count_1hz(10) & !\count_1hz[9]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(10),
	datad => VCC,
	cin => \count_1hz[9]~46\,
	combout => \count_1hz[10]~47_combout\,
	cout => \count_1hz[10]~48\);

-- Location: FF_X28_Y11_N27
\count_1hz[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[10]~47_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(10));

-- Location: LCCOMB_X28_Y11_N28
\count_1hz[11]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[11]~49_combout\ = (count_1hz(11) & (!\count_1hz[10]~48\)) # (!count_1hz(11) & ((\count_1hz[10]~48\) # (GND)))
-- \count_1hz[11]~50\ = CARRY((!\count_1hz[10]~48\) # (!count_1hz(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(11),
	datad => VCC,
	cin => \count_1hz[10]~48\,
	combout => \count_1hz[11]~49_combout\,
	cout => \count_1hz[11]~50\);

-- Location: FF_X28_Y11_N29
\count_1hz[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[11]~49_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(11));

-- Location: LCCOMB_X28_Y11_N30
\count_1hz[12]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[12]~51_combout\ = (count_1hz(12) & (\count_1hz[11]~50\ $ (GND))) # (!count_1hz(12) & (!\count_1hz[11]~50\ & VCC))
-- \count_1hz[12]~52\ = CARRY((count_1hz(12) & !\count_1hz[11]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(12),
	datad => VCC,
	cin => \count_1hz[11]~50\,
	combout => \count_1hz[12]~51_combout\,
	cout => \count_1hz[12]~52\);

-- Location: FF_X28_Y11_N31
\count_1hz[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[12]~51_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(12));

-- Location: LCCOMB_X28_Y10_N0
\count_1hz[13]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[13]~53_combout\ = (count_1hz(13) & (!\count_1hz[12]~52\)) # (!count_1hz(13) & ((\count_1hz[12]~52\) # (GND)))
-- \count_1hz[13]~54\ = CARRY((!\count_1hz[12]~52\) # (!count_1hz(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(13),
	datad => VCC,
	cin => \count_1hz[12]~52\,
	combout => \count_1hz[13]~53_combout\,
	cout => \count_1hz[13]~54\);

-- Location: FF_X28_Y10_N1
\count_1hz[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[13]~53_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(13));

-- Location: LCCOMB_X28_Y10_N2
\count_1hz[14]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[14]~55_combout\ = (count_1hz(14) & (\count_1hz[13]~54\ $ (GND))) # (!count_1hz(14) & (!\count_1hz[13]~54\ & VCC))
-- \count_1hz[14]~56\ = CARRY((count_1hz(14) & !\count_1hz[13]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(14),
	datad => VCC,
	cin => \count_1hz[13]~54\,
	combout => \count_1hz[14]~55_combout\,
	cout => \count_1hz[14]~56\);

-- Location: FF_X28_Y10_N3
\count_1hz[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[14]~55_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(14));

-- Location: LCCOMB_X28_Y10_N4
\count_1hz[15]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[15]~57_combout\ = (count_1hz(15) & (!\count_1hz[14]~56\)) # (!count_1hz(15) & ((\count_1hz[14]~56\) # (GND)))
-- \count_1hz[15]~58\ = CARRY((!\count_1hz[14]~56\) # (!count_1hz(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(15),
	datad => VCC,
	cin => \count_1hz[14]~56\,
	combout => \count_1hz[15]~57_combout\,
	cout => \count_1hz[15]~58\);

-- Location: FF_X28_Y10_N5
\count_1hz[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[15]~57_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(15));

-- Location: LCCOMB_X28_Y10_N6
\count_1hz[16]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[16]~59_combout\ = (count_1hz(16) & (\count_1hz[15]~58\ $ (GND))) # (!count_1hz(16) & (!\count_1hz[15]~58\ & VCC))
-- \count_1hz[16]~60\ = CARRY((count_1hz(16) & !\count_1hz[15]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(16),
	datad => VCC,
	cin => \count_1hz[15]~58\,
	combout => \count_1hz[16]~59_combout\,
	cout => \count_1hz[16]~60\);

-- Location: FF_X28_Y10_N7
\count_1hz[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[16]~59_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(16));

-- Location: LCCOMB_X28_Y10_N8
\count_1hz[17]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[17]~61_combout\ = (count_1hz(17) & (!\count_1hz[16]~60\)) # (!count_1hz(17) & ((\count_1hz[16]~60\) # (GND)))
-- \count_1hz[17]~62\ = CARRY((!\count_1hz[16]~60\) # (!count_1hz(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(17),
	datad => VCC,
	cin => \count_1hz[16]~60\,
	combout => \count_1hz[17]~61_combout\,
	cout => \count_1hz[17]~62\);

-- Location: FF_X28_Y10_N9
\count_1hz[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[17]~61_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(17));

-- Location: LCCOMB_X28_Y10_N10
\count_1hz[18]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[18]~63_combout\ = (count_1hz(18) & (\count_1hz[17]~62\ $ (GND))) # (!count_1hz(18) & (!\count_1hz[17]~62\ & VCC))
-- \count_1hz[18]~64\ = CARRY((count_1hz(18) & !\count_1hz[17]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(18),
	datad => VCC,
	cin => \count_1hz[17]~62\,
	combout => \count_1hz[18]~63_combout\,
	cout => \count_1hz[18]~64\);

-- Location: FF_X28_Y10_N11
\count_1hz[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[18]~63_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(18));

-- Location: LCCOMB_X28_Y10_N12
\count_1hz[19]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[19]~65_combout\ = (count_1hz(19) & (!\count_1hz[18]~64\)) # (!count_1hz(19) & ((\count_1hz[18]~64\) # (GND)))
-- \count_1hz[19]~66\ = CARRY((!\count_1hz[18]~64\) # (!count_1hz(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(19),
	datad => VCC,
	cin => \count_1hz[18]~64\,
	combout => \count_1hz[19]~65_combout\,
	cout => \count_1hz[19]~66\);

-- Location: FF_X28_Y10_N13
\count_1hz[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[19]~65_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(19));

-- Location: LCCOMB_X28_Y10_N14
\count_1hz[20]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[20]~67_combout\ = (count_1hz(20) & (\count_1hz[19]~66\ $ (GND))) # (!count_1hz(20) & (!\count_1hz[19]~66\ & VCC))
-- \count_1hz[20]~68\ = CARRY((count_1hz(20) & !\count_1hz[19]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(20),
	datad => VCC,
	cin => \count_1hz[19]~66\,
	combout => \count_1hz[20]~67_combout\,
	cout => \count_1hz[20]~68\);

-- Location: FF_X28_Y10_N15
\count_1hz[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[20]~67_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(20));

-- Location: LCCOMB_X28_Y10_N16
\count_1hz[21]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[21]~69_combout\ = (count_1hz(21) & (!\count_1hz[20]~68\)) # (!count_1hz(21) & ((\count_1hz[20]~68\) # (GND)))
-- \count_1hz[21]~70\ = CARRY((!\count_1hz[20]~68\) # (!count_1hz(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(21),
	datad => VCC,
	cin => \count_1hz[20]~68\,
	combout => \count_1hz[21]~69_combout\,
	cout => \count_1hz[21]~70\);

-- Location: FF_X28_Y10_N17
\count_1hz[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[21]~69_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(21));

-- Location: LCCOMB_X28_Y10_N18
\count_1hz[22]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[22]~71_combout\ = (count_1hz(22) & (\count_1hz[21]~70\ $ (GND))) # (!count_1hz(22) & (!\count_1hz[21]~70\ & VCC))
-- \count_1hz[22]~72\ = CARRY((count_1hz(22) & !\count_1hz[21]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(22),
	datad => VCC,
	cin => \count_1hz[21]~70\,
	combout => \count_1hz[22]~71_combout\,
	cout => \count_1hz[22]~72\);

-- Location: FF_X28_Y10_N19
\count_1hz[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[22]~71_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(22));

-- Location: LCCOMB_X28_Y10_N20
\count_1hz[23]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[23]~73_combout\ = (count_1hz(23) & (!\count_1hz[22]~72\)) # (!count_1hz(23) & ((\count_1hz[22]~72\) # (GND)))
-- \count_1hz[23]~74\ = CARRY((!\count_1hz[22]~72\) # (!count_1hz(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(23),
	datad => VCC,
	cin => \count_1hz[22]~72\,
	combout => \count_1hz[23]~73_combout\,
	cout => \count_1hz[23]~74\);

-- Location: FF_X28_Y10_N21
\count_1hz[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[23]~73_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(23));

-- Location: LCCOMB_X28_Y10_N22
\count_1hz[24]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[24]~75_combout\ = (count_1hz(24) & (\count_1hz[23]~74\ $ (GND))) # (!count_1hz(24) & (!\count_1hz[23]~74\ & VCC))
-- \count_1hz[24]~76\ = CARRY((count_1hz(24) & !\count_1hz[23]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(24),
	datad => VCC,
	cin => \count_1hz[23]~74\,
	combout => \count_1hz[24]~75_combout\,
	cout => \count_1hz[24]~76\);

-- Location: FF_X28_Y10_N23
\count_1hz[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[24]~75_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(24));

-- Location: LCCOMB_X28_Y10_N24
\count_1hz[25]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1hz[25]~77_combout\ = \count_1hz[24]~76\ $ (count_1hz(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => count_1hz(25),
	cin => \count_1hz[24]~76\,
	combout => \count_1hz[25]~77_combout\);

-- Location: FF_X28_Y10_N25
\count_1hz[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_1hz[25]~77_combout\,
	sclr => \ALT_INV_count_1hz[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1hz(25));

-- Location: LCCOMB_X28_Y10_N30
\LessThan6~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~7_combout\ = (((!count_1hz(18) & !count_1hz(17))) # (!count_1hz(19))) # (!count_1hz(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(18),
	datab => count_1hz(17),
	datac => count_1hz(20),
	datad => count_1hz(19),
	combout => \LessThan6~7_combout\);

-- Location: LCCOMB_X28_Y10_N28
\LessThan6~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~8_combout\ = ((!count_1hz(22)) # (!count_1hz(23))) # (!count_1hz(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_1hz(21),
	datac => count_1hz(23),
	datad => count_1hz(22),
	combout => \LessThan6~8_combout\);

-- Location: LCCOMB_X28_Y10_N26
\LessThan6~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~9_combout\ = ((!count_1hz(24) & ((\LessThan6~7_combout\) # (\LessThan6~8_combout\)))) # (!count_1hz(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1hz(24),
	datab => count_1hz(25),
	datac => \LessThan6~7_combout\,
	datad => \LessThan6~8_combout\,
	combout => \LessThan6~9_combout\);

-- Location: LCCOMB_X29_Y10_N8
\LessThan6~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~10_combout\ = (\LessThan6~9_combout\) # ((\LessThan6~6_combout\) # (\LessThan6~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan6~9_combout\,
	datac => \LessThan6~6_combout\,
	datad => \LessThan6~4_combout\,
	combout => \LessThan6~10_combout\);

-- Location: IOIBUF_X34_Y2_N22
\btn_start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_btn_start,
	o => \btn_start~input_o\);

-- Location: LCCOMB_X29_Y9_N14
\start_sync[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \start_sync[0]~0_combout\ = !\btn_start~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \btn_start~input_o\,
	combout => \start_sync[0]~0_combout\);

-- Location: FF_X29_Y9_N11
\start_sync[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \start_sync[0]~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => start_sync(0));

-- Location: LCCOMB_X29_Y9_N30
\start_sync[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \start_sync[1]~feeder_combout\ = start_sync(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => start_sync(0),
	combout => \start_sync[1]~feeder_combout\);

-- Location: FF_X29_Y9_N31
\start_sync[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \start_sync[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => start_sync(1));

-- Location: LCCOMB_X28_Y9_N12
\deb_cnt_start[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[0]~20_combout\ = deb_cnt_start(0) $ (VCC)
-- \deb_cnt_start[0]~21\ = CARRY(deb_cnt_start(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(0),
	datad => VCC,
	combout => \deb_cnt_start[0]~20_combout\,
	cout => \deb_cnt_start[0]~21\);

-- Location: LCCOMB_X28_Y8_N20
\deb_cnt_start[16]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[16]~34_combout\ = (start_sync(1) $ (!\start_stable~q\)) # (!\LessThan0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => start_sync(1),
	datac => \LessThan0~4_combout\,
	datad => \start_stable~q\,
	combout => \deb_cnt_start[16]~34_combout\);

-- Location: FF_X28_Y9_N13
\deb_cnt_start[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[0]~20_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(0));

-- Location: LCCOMB_X28_Y9_N14
\deb_cnt_start[1]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[1]~22_combout\ = (deb_cnt_start(1) & (!\deb_cnt_start[0]~21\)) # (!deb_cnt_start(1) & ((\deb_cnt_start[0]~21\) # (GND)))
-- \deb_cnt_start[1]~23\ = CARRY((!\deb_cnt_start[0]~21\) # (!deb_cnt_start(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(1),
	datad => VCC,
	cin => \deb_cnt_start[0]~21\,
	combout => \deb_cnt_start[1]~22_combout\,
	cout => \deb_cnt_start[1]~23\);

-- Location: FF_X28_Y9_N15
\deb_cnt_start[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[1]~22_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(1));

-- Location: LCCOMB_X28_Y9_N16
\deb_cnt_start[2]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[2]~24_combout\ = (deb_cnt_start(2) & (\deb_cnt_start[1]~23\ $ (GND))) # (!deb_cnt_start(2) & (!\deb_cnt_start[1]~23\ & VCC))
-- \deb_cnt_start[2]~25\ = CARRY((deb_cnt_start(2) & !\deb_cnt_start[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(2),
	datad => VCC,
	cin => \deb_cnt_start[1]~23\,
	combout => \deb_cnt_start[2]~24_combout\,
	cout => \deb_cnt_start[2]~25\);

-- Location: FF_X28_Y9_N17
\deb_cnt_start[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[2]~24_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(2));

-- Location: LCCOMB_X28_Y9_N18
\deb_cnt_start[3]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[3]~26_combout\ = (deb_cnt_start(3) & (!\deb_cnt_start[2]~25\)) # (!deb_cnt_start(3) & ((\deb_cnt_start[2]~25\) # (GND)))
-- \deb_cnt_start[3]~27\ = CARRY((!\deb_cnt_start[2]~25\) # (!deb_cnt_start(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(3),
	datad => VCC,
	cin => \deb_cnt_start[2]~25\,
	combout => \deb_cnt_start[3]~26_combout\,
	cout => \deb_cnt_start[3]~27\);

-- Location: FF_X28_Y9_N19
\deb_cnt_start[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[3]~26_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(3));

-- Location: LCCOMB_X28_Y9_N20
\deb_cnt_start[4]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[4]~28_combout\ = (deb_cnt_start(4) & (\deb_cnt_start[3]~27\ $ (GND))) # (!deb_cnt_start(4) & (!\deb_cnt_start[3]~27\ & VCC))
-- \deb_cnt_start[4]~29\ = CARRY((deb_cnt_start(4) & !\deb_cnt_start[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(4),
	datad => VCC,
	cin => \deb_cnt_start[3]~27\,
	combout => \deb_cnt_start[4]~28_combout\,
	cout => \deb_cnt_start[4]~29\);

-- Location: FF_X28_Y9_N21
\deb_cnt_start[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[4]~28_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(4));

-- Location: LCCOMB_X28_Y9_N22
\deb_cnt_start[5]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[5]~30_combout\ = (deb_cnt_start(5) & (!\deb_cnt_start[4]~29\)) # (!deb_cnt_start(5) & ((\deb_cnt_start[4]~29\) # (GND)))
-- \deb_cnt_start[5]~31\ = CARRY((!\deb_cnt_start[4]~29\) # (!deb_cnt_start(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(5),
	datad => VCC,
	cin => \deb_cnt_start[4]~29\,
	combout => \deb_cnt_start[5]~30_combout\,
	cout => \deb_cnt_start[5]~31\);

-- Location: FF_X28_Y9_N23
\deb_cnt_start[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[5]~30_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(5));

-- Location: LCCOMB_X28_Y9_N24
\deb_cnt_start[6]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[6]~32_combout\ = (deb_cnt_start(6) & (\deb_cnt_start[5]~31\ $ (GND))) # (!deb_cnt_start(6) & (!\deb_cnt_start[5]~31\ & VCC))
-- \deb_cnt_start[6]~33\ = CARRY((deb_cnt_start(6) & !\deb_cnt_start[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(6),
	datad => VCC,
	cin => \deb_cnt_start[5]~31\,
	combout => \deb_cnt_start[6]~32_combout\,
	cout => \deb_cnt_start[6]~33\);

-- Location: FF_X28_Y9_N25
\deb_cnt_start[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[6]~32_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(6));

-- Location: LCCOMB_X28_Y9_N26
\deb_cnt_start[7]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[7]~35_combout\ = (deb_cnt_start(7) & (!\deb_cnt_start[6]~33\)) # (!deb_cnt_start(7) & ((\deb_cnt_start[6]~33\) # (GND)))
-- \deb_cnt_start[7]~36\ = CARRY((!\deb_cnt_start[6]~33\) # (!deb_cnt_start(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(7),
	datad => VCC,
	cin => \deb_cnt_start[6]~33\,
	combout => \deb_cnt_start[7]~35_combout\,
	cout => \deb_cnt_start[7]~36\);

-- Location: FF_X28_Y9_N27
\deb_cnt_start[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[7]~35_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(7));

-- Location: LCCOMB_X28_Y9_N28
\deb_cnt_start[8]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[8]~37_combout\ = (deb_cnt_start(8) & (\deb_cnt_start[7]~36\ $ (GND))) # (!deb_cnt_start(8) & (!\deb_cnt_start[7]~36\ & VCC))
-- \deb_cnt_start[8]~38\ = CARRY((deb_cnt_start(8) & !\deb_cnt_start[7]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(8),
	datad => VCC,
	cin => \deb_cnt_start[7]~36\,
	combout => \deb_cnt_start[8]~37_combout\,
	cout => \deb_cnt_start[8]~38\);

-- Location: FF_X28_Y9_N29
\deb_cnt_start[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[8]~37_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(8));

-- Location: LCCOMB_X28_Y9_N30
\deb_cnt_start[9]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[9]~39_combout\ = (deb_cnt_start(9) & (!\deb_cnt_start[8]~38\)) # (!deb_cnt_start(9) & ((\deb_cnt_start[8]~38\) # (GND)))
-- \deb_cnt_start[9]~40\ = CARRY((!\deb_cnt_start[8]~38\) # (!deb_cnt_start(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(9),
	datad => VCC,
	cin => \deb_cnt_start[8]~38\,
	combout => \deb_cnt_start[9]~39_combout\,
	cout => \deb_cnt_start[9]~40\);

-- Location: FF_X28_Y9_N31
\deb_cnt_start[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[9]~39_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(9));

-- Location: LCCOMB_X28_Y8_N0
\deb_cnt_start[10]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[10]~41_combout\ = (deb_cnt_start(10) & (\deb_cnt_start[9]~40\ $ (GND))) # (!deb_cnt_start(10) & (!\deb_cnt_start[9]~40\ & VCC))
-- \deb_cnt_start[10]~42\ = CARRY((deb_cnt_start(10) & !\deb_cnt_start[9]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(10),
	datad => VCC,
	cin => \deb_cnt_start[9]~40\,
	combout => \deb_cnt_start[10]~41_combout\,
	cout => \deb_cnt_start[10]~42\);

-- Location: FF_X28_Y8_N1
\deb_cnt_start[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[10]~41_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(10));

-- Location: LCCOMB_X28_Y8_N2
\deb_cnt_start[11]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[11]~43_combout\ = (deb_cnt_start(11) & (!\deb_cnt_start[10]~42\)) # (!deb_cnt_start(11) & ((\deb_cnt_start[10]~42\) # (GND)))
-- \deb_cnt_start[11]~44\ = CARRY((!\deb_cnt_start[10]~42\) # (!deb_cnt_start(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(11),
	datad => VCC,
	cin => \deb_cnt_start[10]~42\,
	combout => \deb_cnt_start[11]~43_combout\,
	cout => \deb_cnt_start[11]~44\);

-- Location: FF_X28_Y8_N3
\deb_cnt_start[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[11]~43_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(11));

-- Location: LCCOMB_X28_Y8_N4
\deb_cnt_start[12]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[12]~45_combout\ = (deb_cnt_start(12) & (\deb_cnt_start[11]~44\ $ (GND))) # (!deb_cnt_start(12) & (!\deb_cnt_start[11]~44\ & VCC))
-- \deb_cnt_start[12]~46\ = CARRY((deb_cnt_start(12) & !\deb_cnt_start[11]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(12),
	datad => VCC,
	cin => \deb_cnt_start[11]~44\,
	combout => \deb_cnt_start[12]~45_combout\,
	cout => \deb_cnt_start[12]~46\);

-- Location: FF_X28_Y8_N5
\deb_cnt_start[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[12]~45_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(12));

-- Location: LCCOMB_X28_Y8_N6
\deb_cnt_start[13]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[13]~47_combout\ = (deb_cnt_start(13) & (!\deb_cnt_start[12]~46\)) # (!deb_cnt_start(13) & ((\deb_cnt_start[12]~46\) # (GND)))
-- \deb_cnt_start[13]~48\ = CARRY((!\deb_cnt_start[12]~46\) # (!deb_cnt_start(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(13),
	datad => VCC,
	cin => \deb_cnt_start[12]~46\,
	combout => \deb_cnt_start[13]~47_combout\,
	cout => \deb_cnt_start[13]~48\);

-- Location: FF_X28_Y8_N7
\deb_cnt_start[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[13]~47_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(13));

-- Location: LCCOMB_X28_Y8_N8
\deb_cnt_start[14]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[14]~49_combout\ = (deb_cnt_start(14) & (\deb_cnt_start[13]~48\ $ (GND))) # (!deb_cnt_start(14) & (!\deb_cnt_start[13]~48\ & VCC))
-- \deb_cnt_start[14]~50\ = CARRY((deb_cnt_start(14) & !\deb_cnt_start[13]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(14),
	datad => VCC,
	cin => \deb_cnt_start[13]~48\,
	combout => \deb_cnt_start[14]~49_combout\,
	cout => \deb_cnt_start[14]~50\);

-- Location: FF_X28_Y8_N9
\deb_cnt_start[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[14]~49_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(14));

-- Location: LCCOMB_X28_Y8_N10
\deb_cnt_start[15]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[15]~51_combout\ = (deb_cnt_start(15) & (!\deb_cnt_start[14]~50\)) # (!deb_cnt_start(15) & ((\deb_cnt_start[14]~50\) # (GND)))
-- \deb_cnt_start[15]~52\ = CARRY((!\deb_cnt_start[14]~50\) # (!deb_cnt_start(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(15),
	datad => VCC,
	cin => \deb_cnt_start[14]~50\,
	combout => \deb_cnt_start[15]~51_combout\,
	cout => \deb_cnt_start[15]~52\);

-- Location: FF_X28_Y8_N11
\deb_cnt_start[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[15]~51_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(15));

-- Location: LCCOMB_X28_Y8_N12
\deb_cnt_start[16]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[16]~53_combout\ = (deb_cnt_start(16) & (\deb_cnt_start[15]~52\ $ (GND))) # (!deb_cnt_start(16) & (!\deb_cnt_start[15]~52\ & VCC))
-- \deb_cnt_start[16]~54\ = CARRY((deb_cnt_start(16) & !\deb_cnt_start[15]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(16),
	datad => VCC,
	cin => \deb_cnt_start[15]~52\,
	combout => \deb_cnt_start[16]~53_combout\,
	cout => \deb_cnt_start[16]~54\);

-- Location: FF_X28_Y8_N13
\deb_cnt_start[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[16]~53_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(16));

-- Location: LCCOMB_X28_Y8_N14
\deb_cnt_start[17]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[17]~55_combout\ = (deb_cnt_start(17) & (!\deb_cnt_start[16]~54\)) # (!deb_cnt_start(17) & ((\deb_cnt_start[16]~54\) # (GND)))
-- \deb_cnt_start[17]~56\ = CARRY((!\deb_cnt_start[16]~54\) # (!deb_cnt_start(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(17),
	datad => VCC,
	cin => \deb_cnt_start[16]~54\,
	combout => \deb_cnt_start[17]~55_combout\,
	cout => \deb_cnt_start[17]~56\);

-- Location: FF_X28_Y8_N15
\deb_cnt_start[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[17]~55_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(17));

-- Location: LCCOMB_X28_Y8_N28
\LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (((!deb_cnt_start(14) & !deb_cnt_start(15))) # (!deb_cnt_start(17))) # (!deb_cnt_start(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(16),
	datab => deb_cnt_start(17),
	datac => deb_cnt_start(14),
	datad => deb_cnt_start(15),
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X28_Y8_N16
\deb_cnt_start[18]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[18]~57_combout\ = (deb_cnt_start(18) & (\deb_cnt_start[17]~56\ $ (GND))) # (!deb_cnt_start(18) & (!\deb_cnt_start[17]~56\ & VCC))
-- \deb_cnt_start[18]~58\ = CARRY((deb_cnt_start(18) & !\deb_cnt_start[17]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_start(18),
	datad => VCC,
	cin => \deb_cnt_start[17]~56\,
	combout => \deb_cnt_start[18]~57_combout\,
	cout => \deb_cnt_start[18]~58\);

-- Location: FF_X28_Y8_N17
\deb_cnt_start[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[18]~57_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(18));

-- Location: LCCOMB_X28_Y8_N24
\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!deb_cnt_start(13) & (!deb_cnt_start(11) & (!deb_cnt_start(12) & !deb_cnt_start(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(13),
	datab => deb_cnt_start(11),
	datac => deb_cnt_start(12),
	datad => deb_cnt_start(10),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X28_Y9_N4
\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ((!deb_cnt_start(6) & (!deb_cnt_start(7) & !deb_cnt_start(8)))) # (!deb_cnt_start(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(9),
	datab => deb_cnt_start(6),
	datac => deb_cnt_start(7),
	datad => deb_cnt_start(8),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X28_Y8_N30
\LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!deb_cnt_start(15) & (\LessThan0~1_combout\ & \LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_start(15),
	datab => \LessThan0~1_combout\,
	datac => \LessThan0~0_combout\,
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X28_Y8_N18
\deb_cnt_start[19]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_start[19]~59_combout\ = \deb_cnt_start[18]~58\ $ (deb_cnt_start(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => deb_cnt_start(19),
	cin => \deb_cnt_start[18]~58\,
	combout => \deb_cnt_start[19]~59_combout\);

-- Location: FF_X28_Y8_N19
\deb_cnt_start[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_start[19]~59_combout\,
	sclr => \deb_cnt_start[16]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_start(19));

-- Location: LCCOMB_X28_Y8_N26
\LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (\LessThan0~3_combout\) # (((\LessThan0~2_combout\) # (!deb_cnt_start(19))) # (!deb_cnt_start(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~3_combout\,
	datab => deb_cnt_start(18),
	datac => \LessThan0~2_combout\,
	datad => deb_cnt_start(19),
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X29_Y9_N18
\start_stable~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \start_stable~0_combout\ = (\LessThan0~4_combout\ & ((\start_stable~q\))) # (!\LessThan0~4_combout\ & (start_sync(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => start_sync(1),
	datac => \start_stable~q\,
	datad => \LessThan0~4_combout\,
	combout => \start_stable~0_combout\);

-- Location: FF_X29_Y9_N19
start_stable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \start_stable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \start_stable~q\);

-- Location: LCCOMB_X29_Y9_N24
\start_prev~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \start_prev~feeder_combout\ = \start_stable~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \start_stable~q\,
	combout => \start_prev~feeder_combout\);

-- Location: FF_X29_Y9_N25
start_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \start_prev~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \start_prev~q\);

-- Location: IOIBUF_X34_Y12_N22
\btn_sec_d~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_btn_sec_d,
	o => \btn_sec_d~input_o\);

-- Location: LCCOMB_X28_Y7_N2
\secd_sync[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \secd_sync[0]~0_combout\ = !\btn_sec_d~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \btn_sec_d~input_o\,
	combout => \secd_sync[0]~0_combout\);

-- Location: FF_X28_Y7_N3
\secd_sync[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \secd_sync[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => secd_sync(0));

-- Location: LCCOMB_X28_Y7_N0
\secd_sync[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \secd_sync[1]~feeder_combout\ = secd_sync(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => secd_sync(0),
	combout => \secd_sync[1]~feeder_combout\);

-- Location: FF_X28_Y7_N1
\secd_sync[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \secd_sync[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => secd_sync(1));

-- Location: LCCOMB_X28_Y7_N12
\deb_cnt_secd[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[0]~20_combout\ = deb_cnt_secd(0) $ (VCC)
-- \deb_cnt_secd[0]~21\ = CARRY(deb_cnt_secd(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(0),
	datad => VCC,
	combout => \deb_cnt_secd[0]~20_combout\,
	cout => \deb_cnt_secd[0]~21\);

-- Location: LCCOMB_X28_Y6_N20
\deb_cnt_secd[11]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[11]~34_combout\ = (\secd_stable~q\ $ (!secd_sync(1))) # (!\LessThan2~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \secd_stable~q\,
	datac => \LessThan2~4_combout\,
	datad => secd_sync(1),
	combout => \deb_cnt_secd[11]~34_combout\);

-- Location: FF_X28_Y7_N13
\deb_cnt_secd[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[0]~20_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(0));

-- Location: LCCOMB_X28_Y7_N14
\deb_cnt_secd[1]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[1]~22_combout\ = (deb_cnt_secd(1) & (!\deb_cnt_secd[0]~21\)) # (!deb_cnt_secd(1) & ((\deb_cnt_secd[0]~21\) # (GND)))
-- \deb_cnt_secd[1]~23\ = CARRY((!\deb_cnt_secd[0]~21\) # (!deb_cnt_secd(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(1),
	datad => VCC,
	cin => \deb_cnt_secd[0]~21\,
	combout => \deb_cnt_secd[1]~22_combout\,
	cout => \deb_cnt_secd[1]~23\);

-- Location: FF_X28_Y7_N15
\deb_cnt_secd[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[1]~22_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(1));

-- Location: LCCOMB_X28_Y7_N16
\deb_cnt_secd[2]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[2]~24_combout\ = (deb_cnt_secd(2) & (\deb_cnt_secd[1]~23\ $ (GND))) # (!deb_cnt_secd(2) & (!\deb_cnt_secd[1]~23\ & VCC))
-- \deb_cnt_secd[2]~25\ = CARRY((deb_cnt_secd(2) & !\deb_cnt_secd[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(2),
	datad => VCC,
	cin => \deb_cnt_secd[1]~23\,
	combout => \deb_cnt_secd[2]~24_combout\,
	cout => \deb_cnt_secd[2]~25\);

-- Location: FF_X28_Y7_N17
\deb_cnt_secd[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[2]~24_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(2));

-- Location: LCCOMB_X28_Y7_N18
\deb_cnt_secd[3]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[3]~26_combout\ = (deb_cnt_secd(3) & (!\deb_cnt_secd[2]~25\)) # (!deb_cnt_secd(3) & ((\deb_cnt_secd[2]~25\) # (GND)))
-- \deb_cnt_secd[3]~27\ = CARRY((!\deb_cnt_secd[2]~25\) # (!deb_cnt_secd(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(3),
	datad => VCC,
	cin => \deb_cnt_secd[2]~25\,
	combout => \deb_cnt_secd[3]~26_combout\,
	cout => \deb_cnt_secd[3]~27\);

-- Location: FF_X28_Y7_N19
\deb_cnt_secd[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[3]~26_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(3));

-- Location: LCCOMB_X28_Y7_N20
\deb_cnt_secd[4]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[4]~28_combout\ = (deb_cnt_secd(4) & (\deb_cnt_secd[3]~27\ $ (GND))) # (!deb_cnt_secd(4) & (!\deb_cnt_secd[3]~27\ & VCC))
-- \deb_cnt_secd[4]~29\ = CARRY((deb_cnt_secd(4) & !\deb_cnt_secd[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(4),
	datad => VCC,
	cin => \deb_cnt_secd[3]~27\,
	combout => \deb_cnt_secd[4]~28_combout\,
	cout => \deb_cnt_secd[4]~29\);

-- Location: FF_X28_Y7_N21
\deb_cnt_secd[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[4]~28_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(4));

-- Location: LCCOMB_X28_Y7_N22
\deb_cnt_secd[5]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[5]~30_combout\ = (deb_cnt_secd(5) & (!\deb_cnt_secd[4]~29\)) # (!deb_cnt_secd(5) & ((\deb_cnt_secd[4]~29\) # (GND)))
-- \deb_cnt_secd[5]~31\ = CARRY((!\deb_cnt_secd[4]~29\) # (!deb_cnt_secd(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(5),
	datad => VCC,
	cin => \deb_cnt_secd[4]~29\,
	combout => \deb_cnt_secd[5]~30_combout\,
	cout => \deb_cnt_secd[5]~31\);

-- Location: FF_X28_Y7_N23
\deb_cnt_secd[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[5]~30_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(5));

-- Location: LCCOMB_X28_Y7_N24
\deb_cnt_secd[6]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[6]~32_combout\ = (deb_cnt_secd(6) & (\deb_cnt_secd[5]~31\ $ (GND))) # (!deb_cnt_secd(6) & (!\deb_cnt_secd[5]~31\ & VCC))
-- \deb_cnt_secd[6]~33\ = CARRY((deb_cnt_secd(6) & !\deb_cnt_secd[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(6),
	datad => VCC,
	cin => \deb_cnt_secd[5]~31\,
	combout => \deb_cnt_secd[6]~32_combout\,
	cout => \deb_cnt_secd[6]~33\);

-- Location: FF_X28_Y7_N25
\deb_cnt_secd[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[6]~32_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(6));

-- Location: LCCOMB_X28_Y7_N26
\deb_cnt_secd[7]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[7]~35_combout\ = (deb_cnt_secd(7) & (!\deb_cnt_secd[6]~33\)) # (!deb_cnt_secd(7) & ((\deb_cnt_secd[6]~33\) # (GND)))
-- \deb_cnt_secd[7]~36\ = CARRY((!\deb_cnt_secd[6]~33\) # (!deb_cnt_secd(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(7),
	datad => VCC,
	cin => \deb_cnt_secd[6]~33\,
	combout => \deb_cnt_secd[7]~35_combout\,
	cout => \deb_cnt_secd[7]~36\);

-- Location: FF_X28_Y7_N27
\deb_cnt_secd[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[7]~35_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(7));

-- Location: LCCOMB_X28_Y7_N28
\deb_cnt_secd[8]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[8]~37_combout\ = (deb_cnt_secd(8) & (\deb_cnt_secd[7]~36\ $ (GND))) # (!deb_cnt_secd(8) & (!\deb_cnt_secd[7]~36\ & VCC))
-- \deb_cnt_secd[8]~38\ = CARRY((deb_cnt_secd(8) & !\deb_cnt_secd[7]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(8),
	datad => VCC,
	cin => \deb_cnt_secd[7]~36\,
	combout => \deb_cnt_secd[8]~37_combout\,
	cout => \deb_cnt_secd[8]~38\);

-- Location: FF_X28_Y7_N29
\deb_cnt_secd[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[8]~37_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(8));

-- Location: LCCOMB_X28_Y7_N30
\deb_cnt_secd[9]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[9]~39_combout\ = (deb_cnt_secd(9) & (!\deb_cnt_secd[8]~38\)) # (!deb_cnt_secd(9) & ((\deb_cnt_secd[8]~38\) # (GND)))
-- \deb_cnt_secd[9]~40\ = CARRY((!\deb_cnt_secd[8]~38\) # (!deb_cnt_secd(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(9),
	datad => VCC,
	cin => \deb_cnt_secd[8]~38\,
	combout => \deb_cnt_secd[9]~39_combout\,
	cout => \deb_cnt_secd[9]~40\);

-- Location: FF_X28_Y7_N31
\deb_cnt_secd[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[9]~39_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(9));

-- Location: LCCOMB_X28_Y6_N0
\deb_cnt_secd[10]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[10]~41_combout\ = (deb_cnt_secd(10) & (\deb_cnt_secd[9]~40\ $ (GND))) # (!deb_cnt_secd(10) & (!\deb_cnt_secd[9]~40\ & VCC))
-- \deb_cnt_secd[10]~42\ = CARRY((deb_cnt_secd(10) & !\deb_cnt_secd[9]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(10),
	datad => VCC,
	cin => \deb_cnt_secd[9]~40\,
	combout => \deb_cnt_secd[10]~41_combout\,
	cout => \deb_cnt_secd[10]~42\);

-- Location: FF_X28_Y6_N1
\deb_cnt_secd[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[10]~41_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(10));

-- Location: LCCOMB_X28_Y6_N2
\deb_cnt_secd[11]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[11]~43_combout\ = (deb_cnt_secd(11) & (!\deb_cnt_secd[10]~42\)) # (!deb_cnt_secd(11) & ((\deb_cnt_secd[10]~42\) # (GND)))
-- \deb_cnt_secd[11]~44\ = CARRY((!\deb_cnt_secd[10]~42\) # (!deb_cnt_secd(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(11),
	datad => VCC,
	cin => \deb_cnt_secd[10]~42\,
	combout => \deb_cnt_secd[11]~43_combout\,
	cout => \deb_cnt_secd[11]~44\);

-- Location: FF_X28_Y6_N3
\deb_cnt_secd[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[11]~43_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(11));

-- Location: LCCOMB_X28_Y6_N4
\deb_cnt_secd[12]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[12]~45_combout\ = (deb_cnt_secd(12) & (\deb_cnt_secd[11]~44\ $ (GND))) # (!deb_cnt_secd(12) & (!\deb_cnt_secd[11]~44\ & VCC))
-- \deb_cnt_secd[12]~46\ = CARRY((deb_cnt_secd(12) & !\deb_cnt_secd[11]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(12),
	datad => VCC,
	cin => \deb_cnt_secd[11]~44\,
	combout => \deb_cnt_secd[12]~45_combout\,
	cout => \deb_cnt_secd[12]~46\);

-- Location: FF_X28_Y6_N5
\deb_cnt_secd[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[12]~45_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(12));

-- Location: LCCOMB_X28_Y6_N6
\deb_cnt_secd[13]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[13]~47_combout\ = (deb_cnt_secd(13) & (!\deb_cnt_secd[12]~46\)) # (!deb_cnt_secd(13) & ((\deb_cnt_secd[12]~46\) # (GND)))
-- \deb_cnt_secd[13]~48\ = CARRY((!\deb_cnt_secd[12]~46\) # (!deb_cnt_secd(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(13),
	datad => VCC,
	cin => \deb_cnt_secd[12]~46\,
	combout => \deb_cnt_secd[13]~47_combout\,
	cout => \deb_cnt_secd[13]~48\);

-- Location: FF_X28_Y6_N7
\deb_cnt_secd[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[13]~47_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(13));

-- Location: LCCOMB_X28_Y6_N8
\deb_cnt_secd[14]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[14]~49_combout\ = (deb_cnt_secd(14) & (\deb_cnt_secd[13]~48\ $ (GND))) # (!deb_cnt_secd(14) & (!\deb_cnt_secd[13]~48\ & VCC))
-- \deb_cnt_secd[14]~50\ = CARRY((deb_cnt_secd(14) & !\deb_cnt_secd[13]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(14),
	datad => VCC,
	cin => \deb_cnt_secd[13]~48\,
	combout => \deb_cnt_secd[14]~49_combout\,
	cout => \deb_cnt_secd[14]~50\);

-- Location: FF_X28_Y6_N9
\deb_cnt_secd[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[14]~49_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(14));

-- Location: LCCOMB_X28_Y6_N10
\deb_cnt_secd[15]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[15]~51_combout\ = (deb_cnt_secd(15) & (!\deb_cnt_secd[14]~50\)) # (!deb_cnt_secd(15) & ((\deb_cnt_secd[14]~50\) # (GND)))
-- \deb_cnt_secd[15]~52\ = CARRY((!\deb_cnt_secd[14]~50\) # (!deb_cnt_secd(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(15),
	datad => VCC,
	cin => \deb_cnt_secd[14]~50\,
	combout => \deb_cnt_secd[15]~51_combout\,
	cout => \deb_cnt_secd[15]~52\);

-- Location: FF_X28_Y6_N11
\deb_cnt_secd[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[15]~51_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(15));

-- Location: LCCOMB_X28_Y6_N12
\deb_cnt_secd[16]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[16]~53_combout\ = (deb_cnt_secd(16) & (\deb_cnt_secd[15]~52\ $ (GND))) # (!deb_cnt_secd(16) & (!\deb_cnt_secd[15]~52\ & VCC))
-- \deb_cnt_secd[16]~54\ = CARRY((deb_cnt_secd(16) & !\deb_cnt_secd[15]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(16),
	datad => VCC,
	cin => \deb_cnt_secd[15]~52\,
	combout => \deb_cnt_secd[16]~53_combout\,
	cout => \deb_cnt_secd[16]~54\);

-- Location: FF_X28_Y6_N13
\deb_cnt_secd[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[16]~53_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(16));

-- Location: LCCOMB_X28_Y6_N14
\deb_cnt_secd[17]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[17]~55_combout\ = (deb_cnt_secd(17) & (!\deb_cnt_secd[16]~54\)) # (!deb_cnt_secd(17) & ((\deb_cnt_secd[16]~54\) # (GND)))
-- \deb_cnt_secd[17]~56\ = CARRY((!\deb_cnt_secd[16]~54\) # (!deb_cnt_secd(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(17),
	datad => VCC,
	cin => \deb_cnt_secd[16]~54\,
	combout => \deb_cnt_secd[17]~55_combout\,
	cout => \deb_cnt_secd[17]~56\);

-- Location: FF_X28_Y6_N15
\deb_cnt_secd[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[17]~55_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(17));

-- Location: LCCOMB_X28_Y6_N28
\LessThan2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~3_combout\ = (((!deb_cnt_secd(14) & !deb_cnt_secd(15))) # (!deb_cnt_secd(17))) # (!deb_cnt_secd(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(16),
	datab => deb_cnt_secd(17),
	datac => deb_cnt_secd(14),
	datad => deb_cnt_secd(15),
	combout => \LessThan2~3_combout\);

-- Location: LCCOMB_X28_Y6_N16
\deb_cnt_secd[18]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[18]~57_combout\ = (deb_cnt_secd(18) & (\deb_cnt_secd[17]~56\ $ (GND))) # (!deb_cnt_secd(18) & (!\deb_cnt_secd[17]~56\ & VCC))
-- \deb_cnt_secd[18]~58\ = CARRY((deb_cnt_secd(18) & !\deb_cnt_secd[17]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secd(18),
	datad => VCC,
	cin => \deb_cnt_secd[17]~56\,
	combout => \deb_cnt_secd[18]~57_combout\,
	cout => \deb_cnt_secd[18]~58\);

-- Location: FF_X28_Y6_N17
\deb_cnt_secd[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[18]~57_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(18));

-- Location: LCCOMB_X28_Y6_N18
\deb_cnt_secd[19]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secd[19]~59_combout\ = \deb_cnt_secd[18]~58\ $ (deb_cnt_secd(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => deb_cnt_secd(19),
	cin => \deb_cnt_secd[18]~58\,
	combout => \deb_cnt_secd[19]~59_combout\);

-- Location: FF_X28_Y6_N19
\deb_cnt_secd[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secd[19]~59_combout\,
	sclr => \deb_cnt_secd[11]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secd(19));

-- Location: LCCOMB_X28_Y7_N10
\LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = ((!deb_cnt_secd(7) & (!deb_cnt_secd(8) & !deb_cnt_secd(6)))) # (!deb_cnt_secd(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(7),
	datab => deb_cnt_secd(8),
	datac => deb_cnt_secd(9),
	datad => deb_cnt_secd(6),
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X28_Y6_N24
\LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (!deb_cnt_secd(13) & (!deb_cnt_secd(11) & (!deb_cnt_secd(12) & !deb_cnt_secd(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(13),
	datab => deb_cnt_secd(11),
	datac => deb_cnt_secd(12),
	datad => deb_cnt_secd(10),
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X28_Y6_N30
\LessThan2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~2_combout\ = (!deb_cnt_secd(15) & (\LessThan2~0_combout\ & \LessThan2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secd(15),
	datac => \LessThan2~0_combout\,
	datad => \LessThan2~1_combout\,
	combout => \LessThan2~2_combout\);

-- Location: LCCOMB_X28_Y6_N22
\LessThan2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~4_combout\ = (\LessThan2~3_combout\) # (((\LessThan2~2_combout\) # (!deb_cnt_secd(18))) # (!deb_cnt_secd(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~3_combout\,
	datab => deb_cnt_secd(19),
	datac => \LessThan2~2_combout\,
	datad => deb_cnt_secd(18),
	combout => \LessThan2~4_combout\);

-- Location: LCCOMB_X29_Y9_N26
\secd_stable~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \secd_stable~0_combout\ = (\LessThan2~4_combout\ & ((\secd_stable~q\))) # (!\LessThan2~4_combout\ & (secd_sync(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => secd_sync(1),
	datac => \secd_stable~q\,
	datad => \LessThan2~4_combout\,
	combout => \secd_stable~0_combout\);

-- Location: FF_X29_Y9_N27
secd_stable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \secd_stable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \secd_stable~q\);

-- Location: LCCOMB_X30_Y9_N12
\deb_cnt_minu[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[0]~20_combout\ = deb_cnt_minu(0) $ (VCC)
-- \deb_cnt_minu[0]~21\ = CARRY(deb_cnt_minu(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(0),
	datad => VCC,
	combout => \deb_cnt_minu[0]~20_combout\,
	cout => \deb_cnt_minu[0]~21\);

-- Location: IOIBUF_X34_Y12_N15
\btn_min_u~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_btn_min_u,
	o => \btn_min_u~input_o\);

-- Location: LCCOMB_X31_Y8_N4
\minu_sync[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \minu_sync[0]~0_combout\ = !\btn_min_u~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \btn_min_u~input_o\,
	combout => \minu_sync[0]~0_combout\);

-- Location: FF_X31_Y8_N5
\minu_sync[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \minu_sync[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => minu_sync(0));

-- Location: LCCOMB_X30_Y8_N24
\minu_sync[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \minu_sync[1]~feeder_combout\ = minu_sync(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => minu_sync(0),
	combout => \minu_sync[1]~feeder_combout\);

-- Location: FF_X30_Y8_N25
\minu_sync[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \minu_sync[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => minu_sync(1));

-- Location: LCCOMB_X30_Y8_N22
\deb_cnt_minu[3]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[3]~52_combout\ = (\minu_stable~q\ $ (!minu_sync(1))) # (!\LessThan3~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111110011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \minu_stable~q\,
	datab => minu_sync(1),
	datac => \LessThan3~4_combout\,
	combout => \deb_cnt_minu[3]~52_combout\);

-- Location: FF_X30_Y9_N13
\deb_cnt_minu[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[0]~20_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(0));

-- Location: LCCOMB_X30_Y9_N14
\deb_cnt_minu[1]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[1]~22_combout\ = (deb_cnt_minu(1) & (!\deb_cnt_minu[0]~21\)) # (!deb_cnt_minu(1) & ((\deb_cnt_minu[0]~21\) # (GND)))
-- \deb_cnt_minu[1]~23\ = CARRY((!\deb_cnt_minu[0]~21\) # (!deb_cnt_minu(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(1),
	datad => VCC,
	cin => \deb_cnt_minu[0]~21\,
	combout => \deb_cnt_minu[1]~22_combout\,
	cout => \deb_cnt_minu[1]~23\);

-- Location: FF_X30_Y9_N15
\deb_cnt_minu[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[1]~22_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(1));

-- Location: LCCOMB_X30_Y9_N16
\deb_cnt_minu[2]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[2]~24_combout\ = (deb_cnt_minu(2) & (\deb_cnt_minu[1]~23\ $ (GND))) # (!deb_cnt_minu(2) & (!\deb_cnt_minu[1]~23\ & VCC))
-- \deb_cnt_minu[2]~25\ = CARRY((deb_cnt_minu(2) & !\deb_cnt_minu[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(2),
	datad => VCC,
	cin => \deb_cnt_minu[1]~23\,
	combout => \deb_cnt_minu[2]~24_combout\,
	cout => \deb_cnt_minu[2]~25\);

-- Location: FF_X30_Y9_N17
\deb_cnt_minu[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[2]~24_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(2));

-- Location: LCCOMB_X30_Y9_N18
\deb_cnt_minu[3]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[3]~26_combout\ = (deb_cnt_minu(3) & (!\deb_cnt_minu[2]~25\)) # (!deb_cnt_minu(3) & ((\deb_cnt_minu[2]~25\) # (GND)))
-- \deb_cnt_minu[3]~27\ = CARRY((!\deb_cnt_minu[2]~25\) # (!deb_cnt_minu(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(3),
	datad => VCC,
	cin => \deb_cnt_minu[2]~25\,
	combout => \deb_cnt_minu[3]~26_combout\,
	cout => \deb_cnt_minu[3]~27\);

-- Location: FF_X30_Y9_N19
\deb_cnt_minu[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[3]~26_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(3));

-- Location: LCCOMB_X30_Y9_N20
\deb_cnt_minu[4]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[4]~28_combout\ = (deb_cnt_minu(4) & (\deb_cnt_minu[3]~27\ $ (GND))) # (!deb_cnt_minu(4) & (!\deb_cnt_minu[3]~27\ & VCC))
-- \deb_cnt_minu[4]~29\ = CARRY((deb_cnt_minu(4) & !\deb_cnt_minu[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(4),
	datad => VCC,
	cin => \deb_cnt_minu[3]~27\,
	combout => \deb_cnt_minu[4]~28_combout\,
	cout => \deb_cnt_minu[4]~29\);

-- Location: FF_X30_Y9_N21
\deb_cnt_minu[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[4]~28_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(4));

-- Location: LCCOMB_X30_Y9_N22
\deb_cnt_minu[5]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[5]~30_combout\ = (deb_cnt_minu(5) & (!\deb_cnt_minu[4]~29\)) # (!deb_cnt_minu(5) & ((\deb_cnt_minu[4]~29\) # (GND)))
-- \deb_cnt_minu[5]~31\ = CARRY((!\deb_cnt_minu[4]~29\) # (!deb_cnt_minu(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(5),
	datad => VCC,
	cin => \deb_cnt_minu[4]~29\,
	combout => \deb_cnt_minu[5]~30_combout\,
	cout => \deb_cnt_minu[5]~31\);

-- Location: FF_X30_Y9_N23
\deb_cnt_minu[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[5]~30_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(5));

-- Location: LCCOMB_X30_Y9_N24
\deb_cnt_minu[6]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[6]~32_combout\ = (deb_cnt_minu(6) & (\deb_cnt_minu[5]~31\ $ (GND))) # (!deb_cnt_minu(6) & (!\deb_cnt_minu[5]~31\ & VCC))
-- \deb_cnt_minu[6]~33\ = CARRY((deb_cnt_minu(6) & !\deb_cnt_minu[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(6),
	datad => VCC,
	cin => \deb_cnt_minu[5]~31\,
	combout => \deb_cnt_minu[6]~32_combout\,
	cout => \deb_cnt_minu[6]~33\);

-- Location: FF_X30_Y9_N25
\deb_cnt_minu[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[6]~32_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(6));

-- Location: LCCOMB_X30_Y9_N26
\deb_cnt_minu[7]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[7]~34_combout\ = (deb_cnt_minu(7) & (!\deb_cnt_minu[6]~33\)) # (!deb_cnt_minu(7) & ((\deb_cnt_minu[6]~33\) # (GND)))
-- \deb_cnt_minu[7]~35\ = CARRY((!\deb_cnt_minu[6]~33\) # (!deb_cnt_minu(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(7),
	datad => VCC,
	cin => \deb_cnt_minu[6]~33\,
	combout => \deb_cnt_minu[7]~34_combout\,
	cout => \deb_cnt_minu[7]~35\);

-- Location: FF_X30_Y9_N27
\deb_cnt_minu[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[7]~34_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(7));

-- Location: LCCOMB_X30_Y9_N28
\deb_cnt_minu[8]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[8]~36_combout\ = (deb_cnt_minu(8) & (\deb_cnt_minu[7]~35\ $ (GND))) # (!deb_cnt_minu(8) & (!\deb_cnt_minu[7]~35\ & VCC))
-- \deb_cnt_minu[8]~37\ = CARRY((deb_cnt_minu(8) & !\deb_cnt_minu[7]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(8),
	datad => VCC,
	cin => \deb_cnt_minu[7]~35\,
	combout => \deb_cnt_minu[8]~36_combout\,
	cout => \deb_cnt_minu[8]~37\);

-- Location: FF_X30_Y9_N29
\deb_cnt_minu[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[8]~36_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(8));

-- Location: LCCOMB_X30_Y9_N30
\deb_cnt_minu[9]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[9]~38_combout\ = (deb_cnt_minu(9) & (!\deb_cnt_minu[8]~37\)) # (!deb_cnt_minu(9) & ((\deb_cnt_minu[8]~37\) # (GND)))
-- \deb_cnt_minu[9]~39\ = CARRY((!\deb_cnt_minu[8]~37\) # (!deb_cnt_minu(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(9),
	datad => VCC,
	cin => \deb_cnt_minu[8]~37\,
	combout => \deb_cnt_minu[9]~38_combout\,
	cout => \deb_cnt_minu[9]~39\);

-- Location: FF_X30_Y9_N31
\deb_cnt_minu[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[9]~38_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(9));

-- Location: LCCOMB_X30_Y8_N0
\deb_cnt_minu[10]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[10]~40_combout\ = (deb_cnt_minu(10) & (\deb_cnt_minu[9]~39\ $ (GND))) # (!deb_cnt_minu(10) & (!\deb_cnt_minu[9]~39\ & VCC))
-- \deb_cnt_minu[10]~41\ = CARRY((deb_cnt_minu(10) & !\deb_cnt_minu[9]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(10),
	datad => VCC,
	cin => \deb_cnt_minu[9]~39\,
	combout => \deb_cnt_minu[10]~40_combout\,
	cout => \deb_cnt_minu[10]~41\);

-- Location: FF_X30_Y8_N1
\deb_cnt_minu[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[10]~40_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(10));

-- Location: LCCOMB_X30_Y8_N2
\deb_cnt_minu[11]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[11]~42_combout\ = (deb_cnt_minu(11) & (!\deb_cnt_minu[10]~41\)) # (!deb_cnt_minu(11) & ((\deb_cnt_minu[10]~41\) # (GND)))
-- \deb_cnt_minu[11]~43\ = CARRY((!\deb_cnt_minu[10]~41\) # (!deb_cnt_minu(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(11),
	datad => VCC,
	cin => \deb_cnt_minu[10]~41\,
	combout => \deb_cnt_minu[11]~42_combout\,
	cout => \deb_cnt_minu[11]~43\);

-- Location: FF_X30_Y8_N3
\deb_cnt_minu[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[11]~42_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(11));

-- Location: LCCOMB_X30_Y8_N4
\deb_cnt_minu[12]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[12]~44_combout\ = (deb_cnt_minu(12) & (\deb_cnt_minu[11]~43\ $ (GND))) # (!deb_cnt_minu(12) & (!\deb_cnt_minu[11]~43\ & VCC))
-- \deb_cnt_minu[12]~45\ = CARRY((deb_cnt_minu(12) & !\deb_cnt_minu[11]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(12),
	datad => VCC,
	cin => \deb_cnt_minu[11]~43\,
	combout => \deb_cnt_minu[12]~44_combout\,
	cout => \deb_cnt_minu[12]~45\);

-- Location: FF_X30_Y8_N5
\deb_cnt_minu[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[12]~44_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(12));

-- Location: LCCOMB_X30_Y8_N6
\deb_cnt_minu[13]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[13]~46_combout\ = (deb_cnt_minu(13) & (!\deb_cnt_minu[12]~45\)) # (!deb_cnt_minu(13) & ((\deb_cnt_minu[12]~45\) # (GND)))
-- \deb_cnt_minu[13]~47\ = CARRY((!\deb_cnt_minu[12]~45\) # (!deb_cnt_minu(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(13),
	datad => VCC,
	cin => \deb_cnt_minu[12]~45\,
	combout => \deb_cnt_minu[13]~46_combout\,
	cout => \deb_cnt_minu[13]~47\);

-- Location: FF_X30_Y8_N7
\deb_cnt_minu[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[13]~46_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(13));

-- Location: LCCOMB_X30_Y8_N8
\deb_cnt_minu[14]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[14]~48_combout\ = (deb_cnt_minu(14) & (\deb_cnt_minu[13]~47\ $ (GND))) # (!deb_cnt_minu(14) & (!\deb_cnt_minu[13]~47\ & VCC))
-- \deb_cnt_minu[14]~49\ = CARRY((deb_cnt_minu(14) & !\deb_cnt_minu[13]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(14),
	datad => VCC,
	cin => \deb_cnt_minu[13]~47\,
	combout => \deb_cnt_minu[14]~48_combout\,
	cout => \deb_cnt_minu[14]~49\);

-- Location: FF_X30_Y8_N9
\deb_cnt_minu[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[14]~48_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(14));

-- Location: LCCOMB_X30_Y8_N10
\deb_cnt_minu[15]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[15]~50_combout\ = (deb_cnt_minu(15) & (!\deb_cnt_minu[14]~49\)) # (!deb_cnt_minu(15) & ((\deb_cnt_minu[14]~49\) # (GND)))
-- \deb_cnt_minu[15]~51\ = CARRY((!\deb_cnt_minu[14]~49\) # (!deb_cnt_minu(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(15),
	datad => VCC,
	cin => \deb_cnt_minu[14]~49\,
	combout => \deb_cnt_minu[15]~50_combout\,
	cout => \deb_cnt_minu[15]~51\);

-- Location: FF_X30_Y8_N11
\deb_cnt_minu[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[15]~50_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(15));

-- Location: LCCOMB_X30_Y8_N12
\deb_cnt_minu[16]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[16]~53_combout\ = (deb_cnt_minu(16) & (\deb_cnt_minu[15]~51\ $ (GND))) # (!deb_cnt_minu(16) & (!\deb_cnt_minu[15]~51\ & VCC))
-- \deb_cnt_minu[16]~54\ = CARRY((deb_cnt_minu(16) & !\deb_cnt_minu[15]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(16),
	datad => VCC,
	cin => \deb_cnt_minu[15]~51\,
	combout => \deb_cnt_minu[16]~53_combout\,
	cout => \deb_cnt_minu[16]~54\);

-- Location: FF_X30_Y8_N13
\deb_cnt_minu[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[16]~53_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(16));

-- Location: LCCOMB_X30_Y8_N14
\deb_cnt_minu[17]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[17]~55_combout\ = (deb_cnt_minu(17) & (!\deb_cnt_minu[16]~54\)) # (!deb_cnt_minu(17) & ((\deb_cnt_minu[16]~54\) # (GND)))
-- \deb_cnt_minu[17]~56\ = CARRY((!\deb_cnt_minu[16]~54\) # (!deb_cnt_minu(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(17),
	datad => VCC,
	cin => \deb_cnt_minu[16]~54\,
	combout => \deb_cnt_minu[17]~55_combout\,
	cout => \deb_cnt_minu[17]~56\);

-- Location: FF_X30_Y8_N15
\deb_cnt_minu[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[17]~55_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(17));

-- Location: LCCOMB_X30_Y8_N16
\deb_cnt_minu[18]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[18]~57_combout\ = (deb_cnt_minu(18) & (\deb_cnt_minu[17]~56\ $ (GND))) # (!deb_cnt_minu(18) & (!\deb_cnt_minu[17]~56\ & VCC))
-- \deb_cnt_minu[18]~58\ = CARRY((deb_cnt_minu(18) & !\deb_cnt_minu[17]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(18),
	datad => VCC,
	cin => \deb_cnt_minu[17]~56\,
	combout => \deb_cnt_minu[18]~57_combout\,
	cout => \deb_cnt_minu[18]~58\);

-- Location: FF_X30_Y8_N17
\deb_cnt_minu[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[18]~57_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(18));

-- Location: LCCOMB_X30_Y8_N18
\deb_cnt_minu[19]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_minu[19]~59_combout\ = \deb_cnt_minu[18]~58\ $ (deb_cnt_minu(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => deb_cnt_minu(19),
	cin => \deb_cnt_minu[18]~58\,
	combout => \deb_cnt_minu[19]~59_combout\);

-- Location: FF_X30_Y8_N19
\deb_cnt_minu[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_minu[19]~59_combout\,
	sclr => \deb_cnt_minu[3]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_minu(19));

-- Location: LCCOMB_X30_Y8_N20
\LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (((!deb_cnt_minu(15) & !deb_cnt_minu(14))) # (!deb_cnt_minu(16))) # (!deb_cnt_minu(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(15),
	datab => deb_cnt_minu(14),
	datac => deb_cnt_minu(17),
	datad => deb_cnt_minu(16),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X30_Y8_N26
\LessThan3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = (!deb_cnt_minu(13) & (!deb_cnt_minu(11) & (!deb_cnt_minu(12) & !deb_cnt_minu(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(13),
	datab => deb_cnt_minu(11),
	datac => deb_cnt_minu(12),
	datad => deb_cnt_minu(10),
	combout => \LessThan3~2_combout\);

-- Location: LCCOMB_X30_Y9_N0
\LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = ((!deb_cnt_minu(7) & (!deb_cnt_minu(8) & !deb_cnt_minu(6)))) # (!deb_cnt_minu(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(7),
	datab => deb_cnt_minu(8),
	datac => deb_cnt_minu(9),
	datad => deb_cnt_minu(6),
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X30_Y8_N28
\LessThan3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~3_combout\ = (\LessThan3~0_combout\) # ((!deb_cnt_minu(15) & (\LessThan3~2_combout\ & \LessThan3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_minu(15),
	datab => \LessThan3~0_combout\,
	datac => \LessThan3~2_combout\,
	datad => \LessThan3~1_combout\,
	combout => \LessThan3~3_combout\);

-- Location: LCCOMB_X30_Y8_N30
\LessThan3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~4_combout\ = ((\LessThan3~3_combout\) # (!deb_cnt_minu(19))) # (!deb_cnt_minu(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_minu(18),
	datac => deb_cnt_minu(19),
	datad => \LessThan3~3_combout\,
	combout => \LessThan3~4_combout\);

-- Location: LCCOMB_X29_Y8_N2
\minu_stable~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \minu_stable~0_combout\ = (\LessThan3~4_combout\ & ((\minu_stable~q\))) # (!\LessThan3~4_combout\ & (minu_sync(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~4_combout\,
	datab => minu_sync(1),
	datac => \minu_stable~q\,
	combout => \minu_stable~0_combout\);

-- Location: FF_X29_Y8_N3
minu_stable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \minu_stable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \minu_stable~q\);

-- Location: FF_X29_Y8_N1
minu_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \minu_stable~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \minu_prev~q\);

-- Location: LCCOMB_X29_Y8_N0
\process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (\minu_prev~q\) # (!\minu_stable~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \minu_prev~q\,
	datad => \minu_stable~q\,
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X26_Y10_N26
\min_uni[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[0]~7_combout\ = (\Equal6~0_combout\ & ((min_uni(0)) # (!\Equal4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => min_uni(0),
	datac => \Equal4~0_combout\,
	datad => \Equal6~0_combout\,
	combout => \min_uni[0]~7_combout\);

-- Location: LCCOMB_X26_Y10_N12
\min_uni[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[0]~8_combout\ = (\running~q\ & (((!\min_uni[0]~7_combout\) # (!\Equal5~1_combout\)))) # (!\running~q\ & (\process_0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal5~1_combout\,
	datac => \running~q\,
	datad => \min_uni[0]~7_combout\,
	combout => \min_uni[0]~8_combout\);

-- Location: LCCOMB_X26_Y10_N30
\min_uni[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[0]~9_combout\ = min_uni(0) $ (((!\min_uni[0]~8_combout\ & !\count_1hz[24]~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \min_uni[0]~8_combout\,
	datac => min_uni(0),
	datad => \count_1hz[24]~26_combout\,
	combout => \min_uni[0]~9_combout\);

-- Location: FF_X26_Y10_N31
\min_uni[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \min_uni[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => min_uni(0));

-- Location: LCCOMB_X29_Y10_N18
\min_uni[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[1]~0_combout\ = (\running~q\ & (((\Equal4~0_combout\) # (!\Equal6~0_combout\)) # (!\Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~1_combout\,
	datab => \Equal6~0_combout\,
	datac => \running~q\,
	datad => \Equal4~0_combout\,
	combout => \min_uni[1]~0_combout\);

-- Location: LCCOMB_X29_Y10_N28
\min_uni[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[1]~1_combout\ = (\min_uni[1]~0_combout\) # ((\running~q\ & ((\LessThan6~10_combout\))) # (!\running~q\ & (\process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => \process_0~0_combout\,
	datac => \LessThan6~10_combout\,
	datad => \min_uni[1]~0_combout\,
	combout => \min_uni[1]~1_combout\);

-- Location: LCCOMB_X29_Y10_N2
\min_uni[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[2]~5_combout\ = (\running~q\ & (!min_uni(1) & !min_uni(0))) # (!\running~q\ & (min_uni(1) & min_uni(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001001000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => min_uni(1),
	datac => min_uni(0),
	combout => \min_uni[2]~5_combout\);

-- Location: LCCOMB_X29_Y10_N14
\min_uni[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[2]~6_combout\ = min_uni(2) $ (((\min_uni[2]~5_combout\ & !\min_uni[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \min_uni[2]~5_combout\,
	datac => min_uni(2),
	datad => \min_uni[1]~1_combout\,
	combout => \min_uni[2]~6_combout\);

-- Location: FF_X29_Y10_N15
\min_uni[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \min_uni[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => min_uni(2));

-- Location: LCCOMB_X29_Y10_N30
\min_uni[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[3]~2_combout\ = (min_uni(2) & ((\running~q\) # ((min_uni(1) & min_uni(0))))) # (!min_uni(2) & (\running~q\ & ((min_uni(1)) # (min_uni(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => min_uni(2),
	datab => min_uni(1),
	datac => min_uni(0),
	datad => \running~q\,
	combout => \min_uni[3]~2_combout\);

-- Location: LCCOMB_X29_Y10_N24
\min_uni[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[3]~3_combout\ = min_uni(3) $ (((\min_uni[3]~2_combout\ & !\min_uni[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \min_uni[3]~2_combout\,
	datab => min_uni(3),
	datad => \min_uni[1]~1_combout\,
	combout => \min_uni[3]~3_combout\);

-- Location: LCCOMB_X29_Y10_N4
\min_uni[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[3]~4_combout\ = (\running~q\ & (\min_uni[1]~1_combout\ $ (((!\min_uni[3]~3_combout\))))) # (!\running~q\ & (\min_uni[3]~3_combout\ & ((\min_uni[1]~1_combout\) # (!\Equal2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => \min_uni[1]~1_combout\,
	datac => \Equal2~0_combout\,
	datad => \min_uni[3]~3_combout\,
	combout => \min_uni[3]~4_combout\);

-- Location: FF_X29_Y10_N5
\min_uni[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \min_uni[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => min_uni(3));

-- Location: LCCOMB_X26_Y10_N24
\Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (min_uni(0) & (!min_uni(1) & (min_uni(3) & !min_uni(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => min_uni(0),
	datab => min_uni(1),
	datac => min_uni(3),
	datad => min_uni(2),
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X26_Y10_N18
\min_uni[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[1]~10_combout\ = (\running~q\ & (min_uni(0) $ (((!min_uni(1)))))) # (!\running~q\ & (!\Equal2~0_combout\ & (min_uni(0) $ (min_uni(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => min_uni(0),
	datab => \Equal2~0_combout\,
	datac => min_uni(1),
	datad => \running~q\,
	combout => \min_uni[1]~10_combout\);

-- Location: LCCOMB_X25_Y10_N4
\min_uni[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \min_uni[1]~11_combout\ = (\min_uni[1]~1_combout\ & ((min_uni(1)))) # (!\min_uni[1]~1_combout\ & (\min_uni[1]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \min_uni[1]~10_combout\,
	datac => min_uni(1),
	datad => \min_uni[1]~1_combout\,
	combout => \min_uni[1]~11_combout\);

-- Location: FF_X25_Y10_N5
\min_uni[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \min_uni[1]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => min_uni(1));

-- Location: LCCOMB_X25_Y10_N6
\Equal4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (!min_uni(0) & (!min_uni(1) & (!min_uni(3) & !min_uni(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => min_uni(0),
	datab => min_uni(1),
	datac => min_uni(3),
	datad => min_uni(2),
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X26_Y10_N28
\sec_dez[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_dez[0]~0_combout\ = (sec_dez(1)) # ((sec_dez(2)) # (!\Equal4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => sec_dez(1),
	datac => \Equal4~0_combout\,
	datad => sec_dez(2),
	combout => \sec_dez[0]~0_combout\);

-- Location: LCCOMB_X26_Y10_N6
\sec_dez[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_dez[0]~1_combout\ = (\running~q\ & (!sec_dez(0) & ((\sec_dez[0]~0_combout\)))) # (!\running~q\ & (sec_dez(0) $ ((\secd_stable~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => sec_dez(0),
	datac => \secd_stable~q\,
	datad => \sec_dez[0]~0_combout\,
	combout => \sec_dez[0]~1_combout\);

-- Location: LCCOMB_X29_Y9_N16
\secd_prev~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \secd_prev~feeder_combout\ = \secd_stable~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \secd_stable~q\,
	combout => \secd_prev~feeder_combout\);

-- Location: FF_X29_Y9_N17
secd_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \secd_prev~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \secd_prev~q\);

-- Location: LCCOMB_X25_Y10_N12
\sec_dez~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_dez~2_combout\ = (\running~q\ & (((!\LessThan6~10_combout\ & \Equal5~1_combout\)))) # (!\running~q\ & (!\secd_prev~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => \secd_prev~q\,
	datac => \LessThan6~10_combout\,
	datad => \Equal5~1_combout\,
	combout => \sec_dez~2_combout\);

-- Location: LCCOMB_X25_Y10_N24
\sec_dez[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_dez[0]~3_combout\ = (\sec_dez~2_combout\ & (\sec_dez[0]~1_combout\)) # (!\sec_dez~2_combout\ & ((sec_dez(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sec_dez[0]~1_combout\,
	datac => sec_dez(0),
	datad => \sec_dez~2_combout\,
	combout => \sec_dez[0]~3_combout\);

-- Location: FF_X25_Y10_N25
\sec_dez[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sec_dez[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sec_dez(0));

-- Location: LCCOMB_X26_Y10_N20
\sec_dez[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_dez[1]~4_combout\ = (sec_dez(1) & (sec_dez(0) $ (((!\running~q\))))) # (!sec_dez(1) & ((sec_dez(0) & (!sec_dez(2) & !\running~q\)) # (!sec_dez(0) & (sec_dez(2) & \running~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100000100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_dez(1),
	datab => sec_dez(0),
	datac => sec_dez(2),
	datad => \running~q\,
	combout => \sec_dez[1]~4_combout\);

-- Location: LCCOMB_X25_Y10_N8
\sec_dez[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_dez[1]~5_combout\ = (\running~q\ & (((\Equal6~0_combout\ & \Equal4~0_combout\)) # (!\Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => \Equal5~1_combout\,
	datac => \Equal6~0_combout\,
	datad => \Equal4~0_combout\,
	combout => \sec_dez[1]~5_combout\);

-- Location: LCCOMB_X29_Y9_N0
\process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~2_combout\ = (\secd_prev~q\) # (!\secd_stable~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \secd_stable~q\,
	datad => \secd_prev~q\,
	combout => \process_0~2_combout\);

-- Location: LCCOMB_X25_Y10_N28
\sec_dez[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_dez[1]~6_combout\ = (\sec_dez[1]~5_combout\) # ((\count_1hz[24]~26_combout\) # ((!\running~q\ & \process_0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => \sec_dez[1]~5_combout\,
	datac => \process_0~2_combout\,
	datad => \count_1hz[24]~26_combout\,
	combout => \sec_dez[1]~6_combout\);

-- Location: LCCOMB_X25_Y10_N30
\sec_dez[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_dez[1]~7_combout\ = (\sec_dez[1]~6_combout\ & ((sec_dez(1)))) # (!\sec_dez[1]~6_combout\ & (\sec_dez[1]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sec_dez[1]~4_combout\,
	datac => sec_dez(1),
	datad => \sec_dez[1]~6_combout\,
	combout => \sec_dez[1]~7_combout\);

-- Location: FF_X25_Y10_N31
\sec_dez[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sec_dez[1]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sec_dez(1));

-- Location: LCCOMB_X25_Y10_N0
\sec_dez[2]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_dez[2]~8_combout\ = (\sec_dez[1]~6_combout\ & (\running~q\)) # (!\sec_dez[1]~6_combout\ & ((sec_dez(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => sec_dez(0),
	datad => \sec_dez[1]~6_combout\,
	combout => \sec_dez[2]~8_combout\);

-- Location: LCCOMB_X25_Y10_N20
\sec_dez[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_dez[2]~9_combout\ = (\running~q\ & (sec_dez(2) $ (((!sec_dez(1) & !\sec_dez[2]~8_combout\))))) # (!\running~q\ & ((sec_dez(2) & ((!\sec_dez[2]~8_combout\))) # (!sec_dez(2) & (sec_dez(1) & \sec_dez[2]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => sec_dez(1),
	datac => sec_dez(2),
	datad => \sec_dez[2]~8_combout\,
	combout => \sec_dez[2]~9_combout\);

-- Location: FF_X25_Y10_N21
\sec_dez[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sec_dez[2]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sec_dez(2));

-- Location: LCCOMB_X25_Y10_N22
\Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = (!sec_dez(2) & (!sec_dez(1) & !sec_dez(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => sec_dez(2),
	datac => sec_dez(1),
	datad => sec_dez(0),
	combout => \Equal6~0_combout\);

-- Location: IOIBUF_X34_Y12_N8
\btn_sec_u~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_btn_sec_u,
	o => \btn_sec_u~input_o\);

-- Location: LCCOMB_X30_Y9_N6
\secu_sync[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \secu_sync[0]~0_combout\ = !\btn_sec_u~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \btn_sec_u~input_o\,
	combout => \secu_sync[0]~0_combout\);

-- Location: FF_X30_Y9_N7
\secu_sync[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \secu_sync[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => secu_sync(0));

-- Location: LCCOMB_X29_Y9_N12
\secu_sync[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \secu_sync[1]~feeder_combout\ = secu_sync(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => secu_sync(0),
	combout => \secu_sync[1]~feeder_combout\);

-- Location: FF_X29_Y9_N13
\secu_sync[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \secu_sync[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => secu_sync(1));

-- Location: LCCOMB_X26_Y7_N12
\deb_cnt_secu[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[0]~20_combout\ = deb_cnt_secu(0) $ (VCC)
-- \deb_cnt_secu[0]~21\ = CARRY(deb_cnt_secu(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(0),
	datad => VCC,
	combout => \deb_cnt_secu[0]~20_combout\,
	cout => \deb_cnt_secu[0]~21\);

-- Location: LCCOMB_X26_Y6_N20
\deb_cnt_secu[12]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[12]~52_combout\ = (secu_sync(1) $ (!\secu_stable~q\)) # (!\LessThan1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => secu_sync(1),
	datac => \LessThan1~4_combout\,
	datad => \secu_stable~q\,
	combout => \deb_cnt_secu[12]~52_combout\);

-- Location: FF_X26_Y7_N13
\deb_cnt_secu[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[0]~20_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(0));

-- Location: LCCOMB_X26_Y7_N14
\deb_cnt_secu[1]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[1]~22_combout\ = (deb_cnt_secu(1) & (!\deb_cnt_secu[0]~21\)) # (!deb_cnt_secu(1) & ((\deb_cnt_secu[0]~21\) # (GND)))
-- \deb_cnt_secu[1]~23\ = CARRY((!\deb_cnt_secu[0]~21\) # (!deb_cnt_secu(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(1),
	datad => VCC,
	cin => \deb_cnt_secu[0]~21\,
	combout => \deb_cnt_secu[1]~22_combout\,
	cout => \deb_cnt_secu[1]~23\);

-- Location: FF_X26_Y7_N15
\deb_cnt_secu[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[1]~22_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(1));

-- Location: LCCOMB_X26_Y7_N16
\deb_cnt_secu[2]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[2]~24_combout\ = (deb_cnt_secu(2) & (\deb_cnt_secu[1]~23\ $ (GND))) # (!deb_cnt_secu(2) & (!\deb_cnt_secu[1]~23\ & VCC))
-- \deb_cnt_secu[2]~25\ = CARRY((deb_cnt_secu(2) & !\deb_cnt_secu[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(2),
	datad => VCC,
	cin => \deb_cnt_secu[1]~23\,
	combout => \deb_cnt_secu[2]~24_combout\,
	cout => \deb_cnt_secu[2]~25\);

-- Location: FF_X26_Y7_N17
\deb_cnt_secu[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[2]~24_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(2));

-- Location: LCCOMB_X26_Y7_N18
\deb_cnt_secu[3]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[3]~26_combout\ = (deb_cnt_secu(3) & (!\deb_cnt_secu[2]~25\)) # (!deb_cnt_secu(3) & ((\deb_cnt_secu[2]~25\) # (GND)))
-- \deb_cnt_secu[3]~27\ = CARRY((!\deb_cnt_secu[2]~25\) # (!deb_cnt_secu(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(3),
	datad => VCC,
	cin => \deb_cnt_secu[2]~25\,
	combout => \deb_cnt_secu[3]~26_combout\,
	cout => \deb_cnt_secu[3]~27\);

-- Location: FF_X26_Y7_N19
\deb_cnt_secu[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[3]~26_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(3));

-- Location: LCCOMB_X26_Y7_N20
\deb_cnt_secu[4]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[4]~28_combout\ = (deb_cnt_secu(4) & (\deb_cnt_secu[3]~27\ $ (GND))) # (!deb_cnt_secu(4) & (!\deb_cnt_secu[3]~27\ & VCC))
-- \deb_cnt_secu[4]~29\ = CARRY((deb_cnt_secu(4) & !\deb_cnt_secu[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(4),
	datad => VCC,
	cin => \deb_cnt_secu[3]~27\,
	combout => \deb_cnt_secu[4]~28_combout\,
	cout => \deb_cnt_secu[4]~29\);

-- Location: FF_X26_Y7_N21
\deb_cnt_secu[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[4]~28_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(4));

-- Location: LCCOMB_X26_Y7_N22
\deb_cnt_secu[5]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[5]~30_combout\ = (deb_cnt_secu(5) & (!\deb_cnt_secu[4]~29\)) # (!deb_cnt_secu(5) & ((\deb_cnt_secu[4]~29\) # (GND)))
-- \deb_cnt_secu[5]~31\ = CARRY((!\deb_cnt_secu[4]~29\) # (!deb_cnt_secu(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(5),
	datad => VCC,
	cin => \deb_cnt_secu[4]~29\,
	combout => \deb_cnt_secu[5]~30_combout\,
	cout => \deb_cnt_secu[5]~31\);

-- Location: FF_X26_Y7_N23
\deb_cnt_secu[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[5]~30_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(5));

-- Location: LCCOMB_X26_Y7_N24
\deb_cnt_secu[6]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[6]~32_combout\ = (deb_cnt_secu(6) & (\deb_cnt_secu[5]~31\ $ (GND))) # (!deb_cnt_secu(6) & (!\deb_cnt_secu[5]~31\ & VCC))
-- \deb_cnt_secu[6]~33\ = CARRY((deb_cnt_secu(6) & !\deb_cnt_secu[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(6),
	datad => VCC,
	cin => \deb_cnt_secu[5]~31\,
	combout => \deb_cnt_secu[6]~32_combout\,
	cout => \deb_cnt_secu[6]~33\);

-- Location: FF_X26_Y7_N25
\deb_cnt_secu[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[6]~32_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(6));

-- Location: LCCOMB_X26_Y7_N26
\deb_cnt_secu[7]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[7]~34_combout\ = (deb_cnt_secu(7) & (!\deb_cnt_secu[6]~33\)) # (!deb_cnt_secu(7) & ((\deb_cnt_secu[6]~33\) # (GND)))
-- \deb_cnt_secu[7]~35\ = CARRY((!\deb_cnt_secu[6]~33\) # (!deb_cnt_secu(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(7),
	datad => VCC,
	cin => \deb_cnt_secu[6]~33\,
	combout => \deb_cnt_secu[7]~34_combout\,
	cout => \deb_cnt_secu[7]~35\);

-- Location: FF_X26_Y7_N27
\deb_cnt_secu[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[7]~34_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(7));

-- Location: LCCOMB_X26_Y7_N28
\deb_cnt_secu[8]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[8]~36_combout\ = (deb_cnt_secu(8) & (\deb_cnt_secu[7]~35\ $ (GND))) # (!deb_cnt_secu(8) & (!\deb_cnt_secu[7]~35\ & VCC))
-- \deb_cnt_secu[8]~37\ = CARRY((deb_cnt_secu(8) & !\deb_cnt_secu[7]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(8),
	datad => VCC,
	cin => \deb_cnt_secu[7]~35\,
	combout => \deb_cnt_secu[8]~36_combout\,
	cout => \deb_cnt_secu[8]~37\);

-- Location: FF_X26_Y7_N29
\deb_cnt_secu[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[8]~36_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(8));

-- Location: LCCOMB_X26_Y7_N30
\deb_cnt_secu[9]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[9]~38_combout\ = (deb_cnt_secu(9) & (!\deb_cnt_secu[8]~37\)) # (!deb_cnt_secu(9) & ((\deb_cnt_secu[8]~37\) # (GND)))
-- \deb_cnt_secu[9]~39\ = CARRY((!\deb_cnt_secu[8]~37\) # (!deb_cnt_secu(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(9),
	datad => VCC,
	cin => \deb_cnt_secu[8]~37\,
	combout => \deb_cnt_secu[9]~38_combout\,
	cout => \deb_cnt_secu[9]~39\);

-- Location: FF_X26_Y7_N31
\deb_cnt_secu[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[9]~38_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(9));

-- Location: LCCOMB_X26_Y6_N0
\deb_cnt_secu[10]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[10]~40_combout\ = (deb_cnt_secu(10) & (\deb_cnt_secu[9]~39\ $ (GND))) # (!deb_cnt_secu(10) & (!\deb_cnt_secu[9]~39\ & VCC))
-- \deb_cnt_secu[10]~41\ = CARRY((deb_cnt_secu(10) & !\deb_cnt_secu[9]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(10),
	datad => VCC,
	cin => \deb_cnt_secu[9]~39\,
	combout => \deb_cnt_secu[10]~40_combout\,
	cout => \deb_cnt_secu[10]~41\);

-- Location: FF_X26_Y6_N1
\deb_cnt_secu[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[10]~40_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(10));

-- Location: LCCOMB_X26_Y6_N2
\deb_cnt_secu[11]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[11]~42_combout\ = (deb_cnt_secu(11) & (!\deb_cnt_secu[10]~41\)) # (!deb_cnt_secu(11) & ((\deb_cnt_secu[10]~41\) # (GND)))
-- \deb_cnt_secu[11]~43\ = CARRY((!\deb_cnt_secu[10]~41\) # (!deb_cnt_secu(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(11),
	datad => VCC,
	cin => \deb_cnt_secu[10]~41\,
	combout => \deb_cnt_secu[11]~42_combout\,
	cout => \deb_cnt_secu[11]~43\);

-- Location: FF_X26_Y6_N3
\deb_cnt_secu[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[11]~42_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(11));

-- Location: LCCOMB_X26_Y6_N4
\deb_cnt_secu[12]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[12]~44_combout\ = (deb_cnt_secu(12) & (\deb_cnt_secu[11]~43\ $ (GND))) # (!deb_cnt_secu(12) & (!\deb_cnt_secu[11]~43\ & VCC))
-- \deb_cnt_secu[12]~45\ = CARRY((deb_cnt_secu(12) & !\deb_cnt_secu[11]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(12),
	datad => VCC,
	cin => \deb_cnt_secu[11]~43\,
	combout => \deb_cnt_secu[12]~44_combout\,
	cout => \deb_cnt_secu[12]~45\);

-- Location: FF_X26_Y6_N5
\deb_cnt_secu[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[12]~44_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(12));

-- Location: LCCOMB_X26_Y6_N6
\deb_cnt_secu[13]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[13]~46_combout\ = (deb_cnt_secu(13) & (!\deb_cnt_secu[12]~45\)) # (!deb_cnt_secu(13) & ((\deb_cnt_secu[12]~45\) # (GND)))
-- \deb_cnt_secu[13]~47\ = CARRY((!\deb_cnt_secu[12]~45\) # (!deb_cnt_secu(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(13),
	datad => VCC,
	cin => \deb_cnt_secu[12]~45\,
	combout => \deb_cnt_secu[13]~46_combout\,
	cout => \deb_cnt_secu[13]~47\);

-- Location: FF_X26_Y6_N7
\deb_cnt_secu[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[13]~46_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(13));

-- Location: LCCOMB_X26_Y6_N8
\deb_cnt_secu[14]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[14]~48_combout\ = (deb_cnt_secu(14) & (\deb_cnt_secu[13]~47\ $ (GND))) # (!deb_cnt_secu(14) & (!\deb_cnt_secu[13]~47\ & VCC))
-- \deb_cnt_secu[14]~49\ = CARRY((deb_cnt_secu(14) & !\deb_cnt_secu[13]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(14),
	datad => VCC,
	cin => \deb_cnt_secu[13]~47\,
	combout => \deb_cnt_secu[14]~48_combout\,
	cout => \deb_cnt_secu[14]~49\);

-- Location: FF_X26_Y6_N9
\deb_cnt_secu[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[14]~48_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(14));

-- Location: LCCOMB_X26_Y6_N10
\deb_cnt_secu[15]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[15]~50_combout\ = (deb_cnt_secu(15) & (!\deb_cnt_secu[14]~49\)) # (!deb_cnt_secu(15) & ((\deb_cnt_secu[14]~49\) # (GND)))
-- \deb_cnt_secu[15]~51\ = CARRY((!\deb_cnt_secu[14]~49\) # (!deb_cnt_secu(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(15),
	datad => VCC,
	cin => \deb_cnt_secu[14]~49\,
	combout => \deb_cnt_secu[15]~50_combout\,
	cout => \deb_cnt_secu[15]~51\);

-- Location: FF_X26_Y6_N11
\deb_cnt_secu[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[15]~50_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(15));

-- Location: LCCOMB_X26_Y6_N12
\deb_cnt_secu[16]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[16]~53_combout\ = (deb_cnt_secu(16) & (\deb_cnt_secu[15]~51\ $ (GND))) # (!deb_cnt_secu(16) & (!\deb_cnt_secu[15]~51\ & VCC))
-- \deb_cnt_secu[16]~54\ = CARRY((deb_cnt_secu(16) & !\deb_cnt_secu[15]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(16),
	datad => VCC,
	cin => \deb_cnt_secu[15]~51\,
	combout => \deb_cnt_secu[16]~53_combout\,
	cout => \deb_cnt_secu[16]~54\);

-- Location: FF_X26_Y6_N13
\deb_cnt_secu[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[16]~53_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(16));

-- Location: LCCOMB_X26_Y6_N14
\deb_cnt_secu[17]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[17]~55_combout\ = (deb_cnt_secu(17) & (!\deb_cnt_secu[16]~54\)) # (!deb_cnt_secu(17) & ((\deb_cnt_secu[16]~54\) # (GND)))
-- \deb_cnt_secu[17]~56\ = CARRY((!\deb_cnt_secu[16]~54\) # (!deb_cnt_secu(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(17),
	datad => VCC,
	cin => \deb_cnt_secu[16]~54\,
	combout => \deb_cnt_secu[17]~55_combout\,
	cout => \deb_cnt_secu[17]~56\);

-- Location: FF_X26_Y6_N15
\deb_cnt_secu[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[17]~55_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(17));

-- Location: LCCOMB_X26_Y6_N16
\deb_cnt_secu[18]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[18]~57_combout\ = (deb_cnt_secu(18) & (\deb_cnt_secu[17]~56\ $ (GND))) # (!deb_cnt_secu(18) & (!\deb_cnt_secu[17]~56\ & VCC))
-- \deb_cnt_secu[18]~58\ = CARRY((deb_cnt_secu(18) & !\deb_cnt_secu[17]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(18),
	datad => VCC,
	cin => \deb_cnt_secu[17]~56\,
	combout => \deb_cnt_secu[18]~57_combout\,
	cout => \deb_cnt_secu[18]~58\);

-- Location: FF_X26_Y6_N17
\deb_cnt_secu[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[18]~57_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(18));

-- Location: LCCOMB_X26_Y6_N18
\deb_cnt_secu[19]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \deb_cnt_secu[19]~59_combout\ = \deb_cnt_secu[18]~58\ $ (deb_cnt_secu(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => deb_cnt_secu(19),
	cin => \deb_cnt_secu[18]~58\,
	combout => \deb_cnt_secu[19]~59_combout\);

-- Location: FF_X26_Y6_N19
\deb_cnt_secu[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \deb_cnt_secu[19]~59_combout\,
	sclr => \deb_cnt_secu[12]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => deb_cnt_secu(19));

-- Location: LCCOMB_X26_Y6_N28
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (((!deb_cnt_secu(14) & !deb_cnt_secu(15))) # (!deb_cnt_secu(17))) # (!deb_cnt_secu(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(16),
	datab => deb_cnt_secu(17),
	datac => deb_cnt_secu(14),
	datad => deb_cnt_secu(15),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X26_Y6_N22
\LessThan1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (!deb_cnt_secu(13) & (!deb_cnt_secu(11) & (!deb_cnt_secu(12) & !deb_cnt_secu(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(13),
	datab => deb_cnt_secu(11),
	datac => deb_cnt_secu(12),
	datad => deb_cnt_secu(10),
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X26_Y7_N2
\LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = ((!deb_cnt_secu(8) & (!deb_cnt_secu(7) & !deb_cnt_secu(6)))) # (!deb_cnt_secu(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(9),
	datab => deb_cnt_secu(8),
	datac => deb_cnt_secu(7),
	datad => deb_cnt_secu(6),
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X26_Y6_N24
\LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (\LessThan1~0_combout\) # ((!deb_cnt_secu(15) & (\LessThan1~2_combout\ & \LessThan1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => deb_cnt_secu(15),
	datab => \LessThan1~0_combout\,
	datac => \LessThan1~2_combout\,
	datad => \LessThan1~1_combout\,
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X26_Y6_N30
\LessThan1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = ((\LessThan1~3_combout\) # (!deb_cnt_secu(19))) # (!deb_cnt_secu(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => deb_cnt_secu(18),
	datac => deb_cnt_secu(19),
	datad => \LessThan1~3_combout\,
	combout => \LessThan1~4_combout\);

-- Location: LCCOMB_X29_Y9_N20
\secu_stable~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \secu_stable~0_combout\ = (\LessThan1~4_combout\ & ((\secu_stable~q\))) # (!\LessThan1~4_combout\ & (secu_sync(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => secu_sync(1),
	datac => \secu_stable~q\,
	datad => \LessThan1~4_combout\,
	combout => \secu_stable~0_combout\);

-- Location: FF_X29_Y9_N21
secu_stable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \secu_stable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \secu_stable~q\);

-- Location: FF_X29_Y9_N15
secu_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \secu_stable~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \secu_prev~q\);

-- Location: LCCOMB_X29_Y9_N10
\process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~1_combout\ = (\secu_prev~q\) # (!\secu_stable~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \secu_prev~q\,
	datad => \secu_stable~q\,
	combout => \process_0~1_combout\);

-- Location: LCCOMB_X29_Y10_N22
\sec_uni[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[1]~1_combout\ = (!\count_1hz[24]~26_combout\ & ((\running~q\ & ((!\process_0~3_combout\))) # (!\running~q\ & (!\process_0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => \process_0~1_combout\,
	datac => \process_0~3_combout\,
	datad => \count_1hz[24]~26_combout\,
	combout => \sec_uni[1]~1_combout\);

-- Location: LCCOMB_X24_Y10_N2
\sec_uni[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[1]~5_combout\ = (\running~q\ & (!\Equal5~1_combout\ & (sec_uni(0) $ (!sec_uni(1))))) # (!\running~q\ & (sec_uni(0) $ ((sec_uni(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_uni(0),
	datab => sec_uni(1),
	datac => \running~q\,
	datad => \Equal5~1_combout\,
	combout => \sec_uni[1]~5_combout\);

-- Location: LCCOMB_X29_Y10_N10
\process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~4_combout\ = (((!\Equal4~0_combout\) # (!\Equal6~0_combout\)) # (!\Equal5~0_combout\)) # (!sec_uni(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_uni(0),
	datab => \Equal5~0_combout\,
	datac => \Equal6~0_combout\,
	datad => \Equal4~0_combout\,
	combout => \process_0~4_combout\);

-- Location: LCCOMB_X24_Y10_N12
\sec_uni[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[1]~6_combout\ = (\sec_uni[1]~5_combout\ & ((\running~q\ & ((\process_0~4_combout\))) # (!\running~q\ & (!\Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \sec_uni[1]~5_combout\,
	datac => \running~q\,
	datad => \process_0~4_combout\,
	combout => \sec_uni[1]~6_combout\);

-- Location: LCCOMB_X24_Y10_N4
\sec_uni[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[1]~7_combout\ = (\sec_uni[1]~1_combout\ & (\sec_uni[1]~6_combout\)) # (!\sec_uni[1]~1_combout\ & ((sec_uni(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sec_uni[1]~6_combout\,
	datac => sec_uni(1),
	datad => \sec_uni[1]~1_combout\,
	combout => \sec_uni[1]~7_combout\);

-- Location: FF_X24_Y10_N5
\sec_uni[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sec_uni[1]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sec_uni(1));

-- Location: LCCOMB_X24_Y10_N0
\sec_uni[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[2]~9_combout\ = (sec_uni(2) & ((sec_uni(1)) # ((sec_uni(0))))) # (!sec_uni(2) & (!sec_uni(1) & (sec_uni(3) & !sec_uni(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_uni(2),
	datab => sec_uni(1),
	datac => sec_uni(3),
	datad => sec_uni(0),
	combout => \sec_uni[2]~9_combout\);

-- Location: LCCOMB_X24_Y10_N14
\sec_uni[2]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[2]~8_combout\ = (!\running~q\ & (sec_uni(2) $ (((sec_uni(1) & sec_uni(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_uni(2),
	datab => sec_uni(1),
	datac => \running~q\,
	datad => sec_uni(0),
	combout => \sec_uni[2]~8_combout\);

-- Location: LCCOMB_X24_Y10_N18
\sec_uni[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[2]~10_combout\ = (\sec_uni[2]~8_combout\) # ((\sec_uni[2]~9_combout\ & (\running~q\ & \process_0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sec_uni[2]~9_combout\,
	datab => \running~q\,
	datac => \sec_uni[2]~8_combout\,
	datad => \process_0~4_combout\,
	combout => \sec_uni[2]~10_combout\);

-- Location: LCCOMB_X24_Y10_N10
\sec_uni[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[2]~11_combout\ = (\sec_uni[1]~1_combout\ & (\sec_uni[2]~10_combout\)) # (!\sec_uni[1]~1_combout\ & ((sec_uni(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sec_uni[2]~10_combout\,
	datac => sec_uni(2),
	datad => \sec_uni[1]~1_combout\,
	combout => \sec_uni[2]~11_combout\);

-- Location: FF_X24_Y10_N11
\sec_uni[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sec_uni[2]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sec_uni(2));

-- Location: LCCOMB_X24_Y10_N26
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!sec_uni(2) & (!sec_uni(1) & (sec_uni(3) & sec_uni(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_uni(2),
	datab => sec_uni(1),
	datac => sec_uni(3),
	datad => sec_uni(0),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X24_Y10_N8
\sec_uni[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[3]~0_combout\ = (\running~q\ & ((\process_0~4_combout\))) # (!\running~q\ & (\Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datac => \running~q\,
	datad => \process_0~4_combout\,
	combout => \sec_uni[3]~0_combout\);

-- Location: LCCOMB_X24_Y10_N30
\sec_uni[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[3]~2_combout\ = (sec_uni(2) & ((\running~q\) # ((sec_uni(1) & sec_uni(0))))) # (!sec_uni(2) & (\running~q\ & ((sec_uni(1)) # (sec_uni(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_uni(2),
	datab => sec_uni(1),
	datac => \running~q\,
	datad => sec_uni(0),
	combout => \sec_uni[3]~2_combout\);

-- Location: LCCOMB_X24_Y10_N28
\sec_uni[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[3]~3_combout\ = sec_uni(3) $ (((\sec_uni[3]~2_combout\ & \sec_uni[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sec_uni[3]~2_combout\,
	datac => sec_uni(3),
	datad => \sec_uni[1]~1_combout\,
	combout => \sec_uni[3]~3_combout\);

-- Location: LCCOMB_X24_Y10_N22
\sec_uni[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[3]~4_combout\ = (\sec_uni[1]~1_combout\ & ((\running~q\ & (\sec_uni[3]~0_combout\ & !\sec_uni[3]~3_combout\)) # (!\running~q\ & (!\sec_uni[3]~0_combout\ & \sec_uni[3]~3_combout\)))) # (!\sec_uni[1]~1_combout\ & (((\sec_uni[3]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => \sec_uni[1]~1_combout\,
	datac => \sec_uni[3]~0_combout\,
	datad => \sec_uni[3]~3_combout\,
	combout => \sec_uni[3]~4_combout\);

-- Location: FF_X24_Y10_N23
\sec_uni[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sec_uni[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sec_uni(3));

-- Location: LCCOMB_X24_Y10_N16
\Equal5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = (!sec_uni(3) & (!sec_uni(1) & !sec_uni(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_uni(3),
	datac => sec_uni(1),
	datad => sec_uni(2),
	combout => \Equal5~0_combout\);

-- Location: LCCOMB_X25_Y10_N14
\alarm~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm~2_combout\ = ((!\Equal4~0_combout\) # (!\Equal5~0_combout\)) # (!\Equal6~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datac => \Equal5~0_combout\,
	datad => \Equal4~0_combout\,
	combout => \alarm~2_combout\);

-- Location: LCCOMB_X29_Y9_N6
\alarm~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm~0_combout\ = (\running~q\) # ((\process_0~0_combout\ & (\process_0~1_combout\ & \process_0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => \process_0~0_combout\,
	datac => \process_0~1_combout\,
	datad => \process_0~2_combout\,
	combout => \alarm~0_combout\);

-- Location: LCCOMB_X29_Y9_N28
\alarm~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm~1_combout\ = (\alarm~0_combout\ & (\alarm~q\ & ((\start_prev~q\) # (!\start_stable~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alarm~0_combout\,
	datab => \start_prev~q\,
	datac => \alarm~q\,
	datad => \start_stable~q\,
	combout => \alarm~1_combout\);

-- Location: LCCOMB_X29_Y9_N8
\alarm~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm~3_combout\ = (\alarm~1_combout\) # ((\running~q\ & (!\alarm~2_combout\ & !\LessThan6~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => \alarm~2_combout\,
	datac => \LessThan6~10_combout\,
	datad => \alarm~1_combout\,
	combout => \alarm~3_combout\);

-- Location: FF_X29_Y9_N9
alarm : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alarm~q\);

-- Location: LCCOMB_X29_Y9_N22
\running~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \running~1_combout\ = (!\start_prev~q\ & (!\alarm~q\ & \start_stable~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \start_prev~q\,
	datac => \alarm~q\,
	datad => \start_stable~q\,
	combout => \running~1_combout\);

-- Location: LCCOMB_X25_Y10_N10
\process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~5_combout\ = ((sec_uni(0)) # ((!\Equal4~0_combout\) # (!\Equal5~0_combout\))) # (!\Equal6~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => sec_uni(0),
	datac => \Equal5~0_combout\,
	datad => \Equal4~0_combout\,
	combout => \process_0~5_combout\);

-- Location: LCCOMB_X26_Y10_N16
\running~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \running~2_combout\ = \running~q\ $ (((\running~1_combout\ & \process_0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datac => \running~1_combout\,
	datad => \process_0~5_combout\,
	combout => \running~2_combout\);

-- Location: LCCOMB_X26_Y10_N2
\running~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \running~3_combout\ = \process_0~3_combout\ $ (((\process_0~4_combout\ & \running~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~3_combout\,
	datac => \process_0~4_combout\,
	datad => \running~2_combout\,
	combout => \running~3_combout\);

-- Location: LCCOMB_X26_Y10_N8
\running~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \running~0_combout\ = (\LessThan6~10_combout\ & (\running~2_combout\)) # (!\LessThan6~10_combout\ & ((\running~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan6~10_combout\,
	datac => \running~2_combout\,
	datad => \running~3_combout\,
	combout => \running~0_combout\);

-- Location: FF_X26_Y10_N9
running : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \running~0_combout\,
	asdata => \running~2_combout\,
	sload => \ALT_INV_running~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \running~q\);

-- Location: LCCOMB_X26_Y9_N0
\sec_uni~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni~12_combout\ = (!\running~q\ & ((\secu_prev~q\) # (!\secu_stable~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datac => \secu_stable~q\,
	datad => \secu_prev~q\,
	combout => \sec_uni~12_combout\);

-- Location: LCCOMB_X24_Y10_N6
\sec_uni[0]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \sec_uni[0]~13_combout\ = (sec_uni(0) & ((\sec_uni~12_combout\) # ((\count_1hz[24]~26_combout\)))) # (!sec_uni(0) & (((\sec_uni[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sec_uni~12_combout\,
	datab => \count_1hz[24]~26_combout\,
	datac => sec_uni(0),
	datad => \sec_uni[1]~1_combout\,
	combout => \sec_uni[0]~13_combout\);

-- Location: FF_X24_Y10_N7
\sec_uni[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sec_uni[0]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sec_uni(0));

-- Location: LCCOMB_X24_Y10_N24
\Equal5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal5~1_combout\ = (!sec_uni(0) & (!sec_uni(1) & (!sec_uni(3) & !sec_uni(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_uni(0),
	datab => sec_uni(1),
	datac => sec_uni(3),
	datad => sec_uni(2),
	combout => \Equal5~1_combout\);

-- Location: LCCOMB_X25_Y10_N16
\process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~3_combout\ = (\Equal5~1_combout\ & (\Equal6~0_combout\ & \Equal4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~1_combout\,
	datac => \Equal6~0_combout\,
	datad => \Equal4~0_combout\,
	combout => \process_0~3_combout\);

-- Location: LCCOMB_X29_Y10_N0
\beep_timer[14]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[14]~28_combout\ = ((!\process_0~3_combout\ & (!\LessThan6~10_combout\ & \process_0~4_combout\))) # (!\running~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~3_combout\,
	datab => \running~q\,
	datac => \LessThan6~10_combout\,
	datad => \process_0~4_combout\,
	combout => \beep_timer[14]~28_combout\);

-- Location: LCCOMB_X30_Y10_N26
\beep_timer[14]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[14]~29_combout\ = ((\LessThan9~8_combout\) # ((!\LessThan6~10_combout\ & \alarm~2_combout\))) # (!\running~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan6~10_combout\,
	datab => \running~q\,
	datac => \alarm~2_combout\,
	datad => \LessThan9~8_combout\,
	combout => \beep_timer[14]~29_combout\);

-- Location: FF_X30_Y11_N7
\beep_timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[0]~26_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(0));

-- Location: LCCOMB_X30_Y11_N8
\beep_timer[1]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[1]~30_combout\ = (beep_timer(1) & (\beep_timer[0]~27\ & VCC)) # (!beep_timer(1) & (!\beep_timer[0]~27\))
-- \beep_timer[1]~31\ = CARRY((!beep_timer(1) & !\beep_timer[0]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(1),
	datad => VCC,
	cin => \beep_timer[0]~27\,
	combout => \beep_timer[1]~30_combout\,
	cout => \beep_timer[1]~31\);

-- Location: FF_X30_Y11_N9
\beep_timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[1]~30_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(1));

-- Location: LCCOMB_X30_Y11_N10
\beep_timer[2]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[2]~32_combout\ = (beep_timer(2) & ((GND) # (!\beep_timer[1]~31\))) # (!beep_timer(2) & (\beep_timer[1]~31\ $ (GND)))
-- \beep_timer[2]~33\ = CARRY((beep_timer(2)) # (!\beep_timer[1]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(2),
	datad => VCC,
	cin => \beep_timer[1]~31\,
	combout => \beep_timer[2]~32_combout\,
	cout => \beep_timer[2]~33\);

-- Location: FF_X30_Y11_N11
\beep_timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[2]~32_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(2));

-- Location: LCCOMB_X30_Y11_N12
\beep_timer[3]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[3]~34_combout\ = (beep_timer(3) & (\beep_timer[2]~33\ & VCC)) # (!beep_timer(3) & (!\beep_timer[2]~33\))
-- \beep_timer[3]~35\ = CARRY((!beep_timer(3) & !\beep_timer[2]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(3),
	datad => VCC,
	cin => \beep_timer[2]~33\,
	combout => \beep_timer[3]~34_combout\,
	cout => \beep_timer[3]~35\);

-- Location: FF_X30_Y11_N13
\beep_timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[3]~34_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(3));

-- Location: LCCOMB_X30_Y11_N14
\beep_timer[4]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[4]~36_combout\ = (beep_timer(4) & ((GND) # (!\beep_timer[3]~35\))) # (!beep_timer(4) & (\beep_timer[3]~35\ $ (GND)))
-- \beep_timer[4]~37\ = CARRY((beep_timer(4)) # (!\beep_timer[3]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(4),
	datad => VCC,
	cin => \beep_timer[3]~35\,
	combout => \beep_timer[4]~36_combout\,
	cout => \beep_timer[4]~37\);

-- Location: FF_X30_Y11_N15
\beep_timer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[4]~36_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(4));

-- Location: LCCOMB_X30_Y11_N16
\beep_timer[5]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[5]~38_combout\ = (beep_timer(5) & (\beep_timer[4]~37\ & VCC)) # (!beep_timer(5) & (!\beep_timer[4]~37\))
-- \beep_timer[5]~39\ = CARRY((!beep_timer(5) & !\beep_timer[4]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(5),
	datad => VCC,
	cin => \beep_timer[4]~37\,
	combout => \beep_timer[5]~38_combout\,
	cout => \beep_timer[5]~39\);

-- Location: FF_X30_Y11_N17
\beep_timer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[5]~38_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(5));

-- Location: LCCOMB_X30_Y11_N18
\beep_timer[6]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[6]~40_combout\ = (beep_timer(6) & ((GND) # (!\beep_timer[5]~39\))) # (!beep_timer(6) & (\beep_timer[5]~39\ $ (GND)))
-- \beep_timer[6]~41\ = CARRY((beep_timer(6)) # (!\beep_timer[5]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(6),
	datad => VCC,
	cin => \beep_timer[5]~39\,
	combout => \beep_timer[6]~40_combout\,
	cout => \beep_timer[6]~41\);

-- Location: FF_X30_Y11_N19
\beep_timer[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[6]~40_combout\,
	asdata => \running~q\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(6));

-- Location: LCCOMB_X30_Y11_N20
\beep_timer[7]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[7]~42_combout\ = (beep_timer(7) & (\beep_timer[6]~41\ & VCC)) # (!beep_timer(7) & (!\beep_timer[6]~41\))
-- \beep_timer[7]~43\ = CARRY((!beep_timer(7) & !\beep_timer[6]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(7),
	datad => VCC,
	cin => \beep_timer[6]~41\,
	combout => \beep_timer[7]~42_combout\,
	cout => \beep_timer[7]~43\);

-- Location: FF_X30_Y11_N21
\beep_timer[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[7]~42_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(7));

-- Location: LCCOMB_X30_Y11_N22
\beep_timer[8]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[8]~44_combout\ = (beep_timer(8) & ((GND) # (!\beep_timer[7]~43\))) # (!beep_timer(8) & (\beep_timer[7]~43\ $ (GND)))
-- \beep_timer[8]~45\ = CARRY((beep_timer(8)) # (!\beep_timer[7]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(8),
	datad => VCC,
	cin => \beep_timer[7]~43\,
	combout => \beep_timer[8]~44_combout\,
	cout => \beep_timer[8]~45\);

-- Location: FF_X30_Y11_N23
\beep_timer[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[8]~44_combout\,
	asdata => \running~q\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(8));

-- Location: LCCOMB_X30_Y11_N24
\beep_timer[9]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[9]~46_combout\ = (beep_timer(9) & (\beep_timer[8]~45\ & VCC)) # (!beep_timer(9) & (!\beep_timer[8]~45\))
-- \beep_timer[9]~47\ = CARRY((!beep_timer(9) & !\beep_timer[8]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(9),
	datad => VCC,
	cin => \beep_timer[8]~45\,
	combout => \beep_timer[9]~46_combout\,
	cout => \beep_timer[9]~47\);

-- Location: FF_X30_Y11_N25
\beep_timer[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[9]~46_combout\,
	asdata => \running~q\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(9));

-- Location: LCCOMB_X30_Y11_N26
\beep_timer[10]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[10]~48_combout\ = (beep_timer(10) & ((GND) # (!\beep_timer[9]~47\))) # (!beep_timer(10) & (\beep_timer[9]~47\ $ (GND)))
-- \beep_timer[10]~49\ = CARRY((beep_timer(10)) # (!\beep_timer[9]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(10),
	datad => VCC,
	cin => \beep_timer[9]~47\,
	combout => \beep_timer[10]~48_combout\,
	cout => \beep_timer[10]~49\);

-- Location: FF_X30_Y11_N27
\beep_timer[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[10]~48_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(10));

-- Location: LCCOMB_X30_Y11_N28
\beep_timer[11]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[11]~50_combout\ = (beep_timer(11) & (\beep_timer[10]~49\ & VCC)) # (!beep_timer(11) & (!\beep_timer[10]~49\))
-- \beep_timer[11]~51\ = CARRY((!beep_timer(11) & !\beep_timer[10]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(11),
	datad => VCC,
	cin => \beep_timer[10]~49\,
	combout => \beep_timer[11]~50_combout\,
	cout => \beep_timer[11]~51\);

-- Location: FF_X30_Y11_N29
\beep_timer[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[11]~50_combout\,
	asdata => \running~q\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(11));

-- Location: LCCOMB_X30_Y11_N30
\beep_timer[12]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[12]~52_combout\ = (beep_timer(12) & ((GND) # (!\beep_timer[11]~51\))) # (!beep_timer(12) & (\beep_timer[11]~51\ $ (GND)))
-- \beep_timer[12]~53\ = CARRY((beep_timer(12)) # (!\beep_timer[11]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(12),
	datad => VCC,
	cin => \beep_timer[11]~51\,
	combout => \beep_timer[12]~52_combout\,
	cout => \beep_timer[12]~53\);

-- Location: FF_X30_Y11_N31
\beep_timer[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[12]~52_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(12));

-- Location: LCCOMB_X30_Y10_N0
\beep_timer[13]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[13]~54_combout\ = (beep_timer(13) & (\beep_timer[12]~53\ & VCC)) # (!beep_timer(13) & (!\beep_timer[12]~53\))
-- \beep_timer[13]~55\ = CARRY((!beep_timer(13) & !\beep_timer[12]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(13),
	datad => VCC,
	cin => \beep_timer[12]~53\,
	combout => \beep_timer[13]~54_combout\,
	cout => \beep_timer[13]~55\);

-- Location: FF_X30_Y10_N1
\beep_timer[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[13]~54_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(13));

-- Location: LCCOMB_X30_Y10_N2
\beep_timer[14]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[14]~56_combout\ = (beep_timer(14) & ((GND) # (!\beep_timer[13]~55\))) # (!beep_timer(14) & (\beep_timer[13]~55\ $ (GND)))
-- \beep_timer[14]~57\ = CARRY((beep_timer(14)) # (!\beep_timer[13]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(14),
	datad => VCC,
	cin => \beep_timer[13]~55\,
	combout => \beep_timer[14]~56_combout\,
	cout => \beep_timer[14]~57\);

-- Location: FF_X30_Y10_N3
\beep_timer[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[14]~56_combout\,
	asdata => \running~q\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(14));

-- Location: LCCOMB_X30_Y10_N4
\beep_timer[15]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[15]~58_combout\ = (beep_timer(15) & (\beep_timer[14]~57\ & VCC)) # (!beep_timer(15) & (!\beep_timer[14]~57\))
-- \beep_timer[15]~59\ = CARRY((!beep_timer(15) & !\beep_timer[14]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(15),
	datad => VCC,
	cin => \beep_timer[14]~57\,
	combout => \beep_timer[15]~58_combout\,
	cout => \beep_timer[15]~59\);

-- Location: FF_X30_Y10_N5
\beep_timer[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[15]~58_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(15));

-- Location: LCCOMB_X30_Y10_N6
\beep_timer[16]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[16]~60_combout\ = (beep_timer(16) & ((GND) # (!\beep_timer[15]~59\))) # (!beep_timer(16) & (\beep_timer[15]~59\ $ (GND)))
-- \beep_timer[16]~61\ = CARRY((beep_timer(16)) # (!\beep_timer[15]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(16),
	datad => VCC,
	cin => \beep_timer[15]~59\,
	combout => \beep_timer[16]~60_combout\,
	cout => \beep_timer[16]~61\);

-- Location: FF_X30_Y10_N7
\beep_timer[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[16]~60_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(16));

-- Location: LCCOMB_X30_Y10_N8
\beep_timer[17]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[17]~62_combout\ = (beep_timer(17) & (\beep_timer[16]~61\ & VCC)) # (!beep_timer(17) & (!\beep_timer[16]~61\))
-- \beep_timer[17]~63\ = CARRY((!beep_timer(17) & !\beep_timer[16]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(17),
	datad => VCC,
	cin => \beep_timer[16]~61\,
	combout => \beep_timer[17]~62_combout\,
	cout => \beep_timer[17]~63\);

-- Location: FF_X30_Y10_N9
\beep_timer[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[17]~62_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(17));

-- Location: LCCOMB_X30_Y10_N10
\beep_timer[18]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[18]~64_combout\ = (beep_timer(18) & ((GND) # (!\beep_timer[17]~63\))) # (!beep_timer(18) & (\beep_timer[17]~63\ $ (GND)))
-- \beep_timer[18]~65\ = CARRY((beep_timer(18)) # (!\beep_timer[17]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(18),
	datad => VCC,
	cin => \beep_timer[17]~63\,
	combout => \beep_timer[18]~64_combout\,
	cout => \beep_timer[18]~65\);

-- Location: FF_X30_Y10_N11
\beep_timer[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[18]~64_combout\,
	asdata => \running~q\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(18));

-- Location: LCCOMB_X30_Y10_N12
\beep_timer[19]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[19]~66_combout\ = (beep_timer(19) & (\beep_timer[18]~65\ & VCC)) # (!beep_timer(19) & (!\beep_timer[18]~65\))
-- \beep_timer[19]~67\ = CARRY((!beep_timer(19) & !\beep_timer[18]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(19),
	datad => VCC,
	cin => \beep_timer[18]~65\,
	combout => \beep_timer[19]~66_combout\,
	cout => \beep_timer[19]~67\);

-- Location: FF_X30_Y10_N13
\beep_timer[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[19]~66_combout\,
	asdata => \running~q\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(19));

-- Location: LCCOMB_X30_Y10_N14
\beep_timer[20]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[20]~68_combout\ = (beep_timer(20) & ((GND) # (!\beep_timer[19]~67\))) # (!beep_timer(20) & (\beep_timer[19]~67\ $ (GND)))
-- \beep_timer[20]~69\ = CARRY((beep_timer(20)) # (!\beep_timer[19]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(20),
	datad => VCC,
	cin => \beep_timer[19]~67\,
	combout => \beep_timer[20]~68_combout\,
	cout => \beep_timer[20]~69\);

-- Location: FF_X30_Y10_N15
\beep_timer[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[20]~68_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(20));

-- Location: LCCOMB_X30_Y10_N16
\beep_timer[21]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[21]~70_combout\ = (beep_timer(21) & (\beep_timer[20]~69\ & VCC)) # (!beep_timer(21) & (!\beep_timer[20]~69\))
-- \beep_timer[21]~71\ = CARRY((!beep_timer(21) & !\beep_timer[20]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(21),
	datad => VCC,
	cin => \beep_timer[20]~69\,
	combout => \beep_timer[21]~70_combout\,
	cout => \beep_timer[21]~71\);

-- Location: FF_X30_Y10_N17
\beep_timer[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[21]~70_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(21));

-- Location: LCCOMB_X30_Y10_N18
\beep_timer[22]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[22]~72_combout\ = (beep_timer(22) & ((GND) # (!\beep_timer[21]~71\))) # (!beep_timer(22) & (\beep_timer[21]~71\ $ (GND)))
-- \beep_timer[22]~73\ = CARRY((beep_timer(22)) # (!\beep_timer[21]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(22),
	datad => VCC,
	cin => \beep_timer[21]~71\,
	combout => \beep_timer[22]~72_combout\,
	cout => \beep_timer[22]~73\);

-- Location: FF_X30_Y10_N19
\beep_timer[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[22]~72_combout\,
	asdata => \running~q\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(22));

-- Location: LCCOMB_X30_Y10_N20
\beep_timer[23]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[23]~74_combout\ = (beep_timer(23) & (\beep_timer[22]~73\ & VCC)) # (!beep_timer(23) & (!\beep_timer[22]~73\))
-- \beep_timer[23]~75\ = CARRY((!beep_timer(23) & !\beep_timer[22]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(23),
	datad => VCC,
	cin => \beep_timer[22]~73\,
	combout => \beep_timer[23]~74_combout\,
	cout => \beep_timer[23]~75\);

-- Location: FF_X30_Y10_N21
\beep_timer[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[23]~74_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(23));

-- Location: LCCOMB_X30_Y10_N22
\beep_timer[24]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[24]~76_combout\ = (beep_timer(24) & ((GND) # (!\beep_timer[23]~75\))) # (!beep_timer(24) & (\beep_timer[23]~75\ $ (GND)))
-- \beep_timer[24]~77\ = CARRY((beep_timer(24)) # (!\beep_timer[23]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(24),
	datad => VCC,
	cin => \beep_timer[23]~75\,
	combout => \beep_timer[24]~76_combout\,
	cout => \beep_timer[24]~77\);

-- Location: FF_X30_Y10_N23
\beep_timer[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[24]~76_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(24));

-- Location: LCCOMB_X30_Y10_N24
\beep_timer[25]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \beep_timer[25]~78_combout\ = \beep_timer[24]~77\ $ (!beep_timer(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => beep_timer(25),
	cin => \beep_timer[24]~77\,
	combout => \beep_timer[25]~78_combout\);

-- Location: FF_X30_Y10_N25
\beep_timer[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \beep_timer[25]~78_combout\,
	asdata => \~GND~combout\,
	sload => \beep_timer[14]~28_combout\,
	ena => \beep_timer[14]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => beep_timer(25));

-- Location: LCCOMB_X31_Y10_N30
\LessThan9~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~7_combout\ = (beep_timer(24)) # (beep_timer(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => beep_timer(24),
	datad => beep_timer(25),
	combout => \LessThan9~7_combout\);

-- Location: LCCOMB_X31_Y10_N10
\LessThan9~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~5_combout\ = (beep_timer(19)) # ((beep_timer(16)) # ((beep_timer(18)) # (beep_timer(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(19),
	datab => beep_timer(16),
	datac => beep_timer(18),
	datad => beep_timer(17),
	combout => \LessThan9~5_combout\);

-- Location: LCCOMB_X30_Y11_N0
\LessThan9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~0_combout\ = (beep_timer(3)) # ((beep_timer(1)) # ((beep_timer(2)) # (beep_timer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(3),
	datab => beep_timer(1),
	datac => beep_timer(2),
	datad => beep_timer(0),
	combout => \LessThan9~0_combout\);

-- Location: LCCOMB_X30_Y11_N4
\LessThan9~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~2_combout\ = (beep_timer(8)) # ((beep_timer(11)) # ((beep_timer(10)) # (beep_timer(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(8),
	datab => beep_timer(11),
	datac => beep_timer(10),
	datad => beep_timer(9),
	combout => \LessThan9~2_combout\);

-- Location: LCCOMB_X31_Y10_N8
\LessThan9~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~3_combout\ = (beep_timer(13)) # ((beep_timer(15)) # ((beep_timer(12)) # (beep_timer(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(13),
	datab => beep_timer(15),
	datac => beep_timer(12),
	datad => beep_timer(14),
	combout => \LessThan9~3_combout\);

-- Location: LCCOMB_X30_Y11_N2
\LessThan9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~1_combout\ = (beep_timer(7)) # ((beep_timer(5)) # ((beep_timer(4)) # (beep_timer(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(7),
	datab => beep_timer(5),
	datac => beep_timer(4),
	datad => beep_timer(6),
	combout => \LessThan9~1_combout\);

-- Location: LCCOMB_X30_Y10_N30
\LessThan9~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~4_combout\ = (\LessThan9~0_combout\) # ((\LessThan9~2_combout\) # ((\LessThan9~3_combout\) # (\LessThan9~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan9~0_combout\,
	datab => \LessThan9~2_combout\,
	datac => \LessThan9~3_combout\,
	datad => \LessThan9~1_combout\,
	combout => \LessThan9~4_combout\);

-- Location: LCCOMB_X31_Y10_N12
\LessThan9~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~6_combout\ = (beep_timer(20)) # ((beep_timer(23)) # ((beep_timer(21)) # (beep_timer(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => beep_timer(20),
	datab => beep_timer(23),
	datac => beep_timer(21),
	datad => beep_timer(22),
	combout => \LessThan9~6_combout\);

-- Location: LCCOMB_X30_Y10_N28
\LessThan9~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~8_combout\ = (\LessThan9~7_combout\) # ((\LessThan9~5_combout\) # ((\LessThan9~4_combout\) # (\LessThan9~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan9~7_combout\,
	datab => \LessThan9~5_combout\,
	datac => \LessThan9~4_combout\,
	datad => \LessThan9~6_combout\,
	combout => \LessThan9~8_combout\);

-- Location: LCCOMB_X30_Y6_N6
\alarm_cnt[0]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[0]~26_combout\ = alarm_cnt(0) $ (VCC)
-- \alarm_cnt[0]~27\ = CARRY(alarm_cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(0),
	datad => VCC,
	combout => \alarm_cnt[0]~26_combout\,
	cout => \alarm_cnt[0]~27\);

-- Location: LCCOMB_X30_Y5_N20
\alarm_cnt[23]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[23]~74_combout\ = (alarm_cnt(23) & (!\alarm_cnt[22]~73\)) # (!alarm_cnt(23) & ((\alarm_cnt[22]~73\) # (GND)))
-- \alarm_cnt[23]~75\ = CARRY((!\alarm_cnt[22]~73\) # (!alarm_cnt(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(23),
	datad => VCC,
	cin => \alarm_cnt[22]~73\,
	combout => \alarm_cnt[23]~74_combout\,
	cout => \alarm_cnt[23]~75\);

-- Location: LCCOMB_X30_Y5_N22
\alarm_cnt[24]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[24]~76_combout\ = (alarm_cnt(24) & (\alarm_cnt[23]~75\ $ (GND))) # (!alarm_cnt(24) & (!\alarm_cnt[23]~75\ & VCC))
-- \alarm_cnt[24]~77\ = CARRY((alarm_cnt(24) & !\alarm_cnt[23]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(24),
	datad => VCC,
	cin => \alarm_cnt[23]~75\,
	combout => \alarm_cnt[24]~76_combout\,
	cout => \alarm_cnt[24]~77\);

-- Location: FF_X30_Y5_N23
\alarm_cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[24]~76_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(24));

-- Location: LCCOMB_X30_Y5_N24
\alarm_cnt[25]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[25]~78_combout\ = \alarm_cnt[24]~77\ $ (alarm_cnt(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => alarm_cnt(25),
	cin => \alarm_cnt[24]~77\,
	combout => \alarm_cnt[25]~78_combout\);

-- Location: FF_X30_Y5_N25
\alarm_cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[25]~78_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(25));

-- Location: LCCOMB_X29_Y6_N4
\alarm_cnt[0]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[0]~68_combout\ = (\alarm~q\ & !alarm_cnt(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \alarm~q\,
	datad => alarm_cnt(24),
	combout => \alarm_cnt[0]~68_combout\);

-- Location: LCCOMB_X30_Y6_N4
\LessThan8~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~7_combout\ = ((!alarm_cnt(10) & ((!alarm_cnt(9)) # (!alarm_cnt(8))))) # (!alarm_cnt(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(8),
	datab => alarm_cnt(9),
	datac => alarm_cnt(10),
	datad => alarm_cnt(11),
	combout => \LessThan8~7_combout\);

-- Location: LCCOMB_X29_Y6_N16
\LessThan8~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~8_combout\ = ((!alarm_cnt(12) & (!alarm_cnt(13) & \LessThan8~7_combout\))) # (!alarm_cnt(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(12),
	datab => alarm_cnt(13),
	datac => alarm_cnt(14),
	datad => \LessThan8~7_combout\,
	combout => \LessThan8~8_combout\);

-- Location: LCCOMB_X30_Y5_N26
\LessThan8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~0_combout\ = (!alarm_cnt(20) & !alarm_cnt(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => alarm_cnt(20),
	datad => alarm_cnt(21),
	combout => \LessThan8~0_combout\);

-- Location: LCCOMB_X30_Y5_N30
\LessThan8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~2_combout\ = (!alarm_cnt(15) & (!alarm_cnt(17) & (\LessThan8~0_combout\ & !alarm_cnt(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(15),
	datab => alarm_cnt(17),
	datac => \LessThan8~0_combout\,
	datad => alarm_cnt(16),
	combout => \LessThan8~2_combout\);

-- Location: LCCOMB_X29_Y6_N28
\LessThan8~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~5_combout\ = (!alarm_cnt(5)) # (!alarm_cnt(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => alarm_cnt(4),
	datad => alarm_cnt(5),
	combout => \LessThan8~5_combout\);

-- Location: LCCOMB_X29_Y6_N26
\LessThan8~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~4_combout\ = (((!alarm_cnt(1)) # (!alarm_cnt(3))) # (!alarm_cnt(2))) # (!alarm_cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(0),
	datab => alarm_cnt(2),
	datac => alarm_cnt(3),
	datad => alarm_cnt(1),
	combout => \LessThan8~4_combout\);

-- Location: LCCOMB_X29_Y6_N12
\LessThan8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~3_combout\ = (!alarm_cnt(12) & (!alarm_cnt(6) & (!alarm_cnt(10) & !alarm_cnt(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(12),
	datab => alarm_cnt(6),
	datac => alarm_cnt(10),
	datad => alarm_cnt(13),
	combout => \LessThan8~3_combout\);

-- Location: LCCOMB_X29_Y6_N6
\LessThan8~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~6_combout\ = (!alarm_cnt(7) & (\LessThan8~3_combout\ & ((\LessThan8~5_combout\) # (\LessThan8~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(7),
	datab => \LessThan8~5_combout\,
	datac => \LessThan8~4_combout\,
	datad => \LessThan8~3_combout\,
	combout => \LessThan8~6_combout\);

-- Location: LCCOMB_X30_Y5_N28
\LessThan8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~1_combout\ = ((\LessThan8~0_combout\ & ((!alarm_cnt(18)) # (!alarm_cnt(19))))) # (!alarm_cnt(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(19),
	datab => alarm_cnt(22),
	datac => \LessThan8~0_combout\,
	datad => alarm_cnt(18),
	combout => \LessThan8~1_combout\);

-- Location: LCCOMB_X30_Y6_N2
\LessThan8~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~9_combout\ = (\LessThan8~1_combout\) # ((\LessThan8~2_combout\ & ((\LessThan8~8_combout\) # (\LessThan8~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan8~8_combout\,
	datab => \LessThan8~2_combout\,
	datac => \LessThan8~6_combout\,
	datad => \LessThan8~1_combout\,
	combout => \LessThan8~9_combout\);

-- Location: LCCOMB_X30_Y6_N0
\alarm_cnt[0]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[0]~69_combout\ = (alarm_cnt(25)) # ((alarm_cnt(23)) # ((!\LessThan8~9_combout\) # (!\alarm_cnt[0]~68_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(25),
	datab => alarm_cnt(23),
	datac => \alarm_cnt[0]~68_combout\,
	datad => \LessThan8~9_combout\,
	combout => \alarm_cnt[0]~69_combout\);

-- Location: FF_X30_Y6_N7
\alarm_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[0]~26_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(0));

-- Location: LCCOMB_X30_Y6_N8
\alarm_cnt[1]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[1]~28_combout\ = (alarm_cnt(1) & (!\alarm_cnt[0]~27\)) # (!alarm_cnt(1) & ((\alarm_cnt[0]~27\) # (GND)))
-- \alarm_cnt[1]~29\ = CARRY((!\alarm_cnt[0]~27\) # (!alarm_cnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(1),
	datad => VCC,
	cin => \alarm_cnt[0]~27\,
	combout => \alarm_cnt[1]~28_combout\,
	cout => \alarm_cnt[1]~29\);

-- Location: FF_X30_Y6_N9
\alarm_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[1]~28_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(1));

-- Location: LCCOMB_X30_Y6_N10
\alarm_cnt[2]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[2]~30_combout\ = (alarm_cnt(2) & (\alarm_cnt[1]~29\ $ (GND))) # (!alarm_cnt(2) & (!\alarm_cnt[1]~29\ & VCC))
-- \alarm_cnt[2]~31\ = CARRY((alarm_cnt(2) & !\alarm_cnt[1]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(2),
	datad => VCC,
	cin => \alarm_cnt[1]~29\,
	combout => \alarm_cnt[2]~30_combout\,
	cout => \alarm_cnt[2]~31\);

-- Location: FF_X30_Y6_N11
\alarm_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[2]~30_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(2));

-- Location: LCCOMB_X30_Y6_N12
\alarm_cnt[3]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[3]~32_combout\ = (alarm_cnt(3) & (!\alarm_cnt[2]~31\)) # (!alarm_cnt(3) & ((\alarm_cnt[2]~31\) # (GND)))
-- \alarm_cnt[3]~33\ = CARRY((!\alarm_cnt[2]~31\) # (!alarm_cnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(3),
	datad => VCC,
	cin => \alarm_cnt[2]~31\,
	combout => \alarm_cnt[3]~32_combout\,
	cout => \alarm_cnt[3]~33\);

-- Location: FF_X30_Y6_N13
\alarm_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[3]~32_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(3));

-- Location: LCCOMB_X30_Y6_N14
\alarm_cnt[4]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[4]~34_combout\ = (alarm_cnt(4) & (\alarm_cnt[3]~33\ $ (GND))) # (!alarm_cnt(4) & (!\alarm_cnt[3]~33\ & VCC))
-- \alarm_cnt[4]~35\ = CARRY((alarm_cnt(4) & !\alarm_cnt[3]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(4),
	datad => VCC,
	cin => \alarm_cnt[3]~33\,
	combout => \alarm_cnt[4]~34_combout\,
	cout => \alarm_cnt[4]~35\);

-- Location: FF_X30_Y6_N15
\alarm_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[4]~34_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(4));

-- Location: LCCOMB_X30_Y6_N16
\alarm_cnt[5]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[5]~36_combout\ = (alarm_cnt(5) & (!\alarm_cnt[4]~35\)) # (!alarm_cnt(5) & ((\alarm_cnt[4]~35\) # (GND)))
-- \alarm_cnt[5]~37\ = CARRY((!\alarm_cnt[4]~35\) # (!alarm_cnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(5),
	datad => VCC,
	cin => \alarm_cnt[4]~35\,
	combout => \alarm_cnt[5]~36_combout\,
	cout => \alarm_cnt[5]~37\);

-- Location: FF_X30_Y6_N17
\alarm_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[5]~36_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(5));

-- Location: LCCOMB_X30_Y6_N18
\alarm_cnt[6]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[6]~38_combout\ = (alarm_cnt(6) & (\alarm_cnt[5]~37\ $ (GND))) # (!alarm_cnt(6) & (!\alarm_cnt[5]~37\ & VCC))
-- \alarm_cnt[6]~39\ = CARRY((alarm_cnt(6) & !\alarm_cnt[5]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(6),
	datad => VCC,
	cin => \alarm_cnt[5]~37\,
	combout => \alarm_cnt[6]~38_combout\,
	cout => \alarm_cnt[6]~39\);

-- Location: FF_X30_Y6_N19
\alarm_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[6]~38_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(6));

-- Location: LCCOMB_X30_Y6_N20
\alarm_cnt[7]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[7]~40_combout\ = (alarm_cnt(7) & (!\alarm_cnt[6]~39\)) # (!alarm_cnt(7) & ((\alarm_cnt[6]~39\) # (GND)))
-- \alarm_cnt[7]~41\ = CARRY((!\alarm_cnt[6]~39\) # (!alarm_cnt(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(7),
	datad => VCC,
	cin => \alarm_cnt[6]~39\,
	combout => \alarm_cnt[7]~40_combout\,
	cout => \alarm_cnt[7]~41\);

-- Location: FF_X30_Y6_N21
\alarm_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[7]~40_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(7));

-- Location: LCCOMB_X30_Y6_N22
\alarm_cnt[8]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[8]~42_combout\ = (alarm_cnt(8) & (\alarm_cnt[7]~41\ $ (GND))) # (!alarm_cnt(8) & (!\alarm_cnt[7]~41\ & VCC))
-- \alarm_cnt[8]~43\ = CARRY((alarm_cnt(8) & !\alarm_cnt[7]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(8),
	datad => VCC,
	cin => \alarm_cnt[7]~41\,
	combout => \alarm_cnt[8]~42_combout\,
	cout => \alarm_cnt[8]~43\);

-- Location: FF_X30_Y6_N23
\alarm_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[8]~42_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(8));

-- Location: LCCOMB_X30_Y6_N24
\alarm_cnt[9]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[9]~44_combout\ = (alarm_cnt(9) & (!\alarm_cnt[8]~43\)) # (!alarm_cnt(9) & ((\alarm_cnt[8]~43\) # (GND)))
-- \alarm_cnt[9]~45\ = CARRY((!\alarm_cnt[8]~43\) # (!alarm_cnt(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(9),
	datad => VCC,
	cin => \alarm_cnt[8]~43\,
	combout => \alarm_cnt[9]~44_combout\,
	cout => \alarm_cnt[9]~45\);

-- Location: FF_X30_Y6_N25
\alarm_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[9]~44_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(9));

-- Location: LCCOMB_X30_Y6_N26
\alarm_cnt[10]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[10]~46_combout\ = (alarm_cnt(10) & (\alarm_cnt[9]~45\ $ (GND))) # (!alarm_cnt(10) & (!\alarm_cnt[9]~45\ & VCC))
-- \alarm_cnt[10]~47\ = CARRY((alarm_cnt(10) & !\alarm_cnt[9]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(10),
	datad => VCC,
	cin => \alarm_cnt[9]~45\,
	combout => \alarm_cnt[10]~46_combout\,
	cout => \alarm_cnt[10]~47\);

-- Location: FF_X30_Y6_N27
\alarm_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[10]~46_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(10));

-- Location: LCCOMB_X30_Y6_N28
\alarm_cnt[11]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[11]~48_combout\ = (alarm_cnt(11) & (!\alarm_cnt[10]~47\)) # (!alarm_cnt(11) & ((\alarm_cnt[10]~47\) # (GND)))
-- \alarm_cnt[11]~49\ = CARRY((!\alarm_cnt[10]~47\) # (!alarm_cnt(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(11),
	datad => VCC,
	cin => \alarm_cnt[10]~47\,
	combout => \alarm_cnt[11]~48_combout\,
	cout => \alarm_cnt[11]~49\);

-- Location: FF_X30_Y6_N29
\alarm_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[11]~48_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(11));

-- Location: LCCOMB_X30_Y6_N30
\alarm_cnt[12]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[12]~50_combout\ = (alarm_cnt(12) & (\alarm_cnt[11]~49\ $ (GND))) # (!alarm_cnt(12) & (!\alarm_cnt[11]~49\ & VCC))
-- \alarm_cnt[12]~51\ = CARRY((alarm_cnt(12) & !\alarm_cnt[11]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(12),
	datad => VCC,
	cin => \alarm_cnt[11]~49\,
	combout => \alarm_cnt[12]~50_combout\,
	cout => \alarm_cnt[12]~51\);

-- Location: FF_X30_Y6_N31
\alarm_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[12]~50_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(12));

-- Location: LCCOMB_X30_Y5_N0
\alarm_cnt[13]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[13]~52_combout\ = (alarm_cnt(13) & (!\alarm_cnt[12]~51\)) # (!alarm_cnt(13) & ((\alarm_cnt[12]~51\) # (GND)))
-- \alarm_cnt[13]~53\ = CARRY((!\alarm_cnt[12]~51\) # (!alarm_cnt(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(13),
	datad => VCC,
	cin => \alarm_cnt[12]~51\,
	combout => \alarm_cnt[13]~52_combout\,
	cout => \alarm_cnt[13]~53\);

-- Location: FF_X30_Y5_N1
\alarm_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[13]~52_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(13));

-- Location: LCCOMB_X30_Y5_N2
\alarm_cnt[14]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[14]~54_combout\ = (alarm_cnt(14) & (\alarm_cnt[13]~53\ $ (GND))) # (!alarm_cnt(14) & (!\alarm_cnt[13]~53\ & VCC))
-- \alarm_cnt[14]~55\ = CARRY((alarm_cnt(14) & !\alarm_cnt[13]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(14),
	datad => VCC,
	cin => \alarm_cnt[13]~53\,
	combout => \alarm_cnt[14]~54_combout\,
	cout => \alarm_cnt[14]~55\);

-- Location: FF_X30_Y5_N3
\alarm_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[14]~54_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(14));

-- Location: LCCOMB_X30_Y5_N4
\alarm_cnt[15]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[15]~56_combout\ = (alarm_cnt(15) & (!\alarm_cnt[14]~55\)) # (!alarm_cnt(15) & ((\alarm_cnt[14]~55\) # (GND)))
-- \alarm_cnt[15]~57\ = CARRY((!\alarm_cnt[14]~55\) # (!alarm_cnt(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(15),
	datad => VCC,
	cin => \alarm_cnt[14]~55\,
	combout => \alarm_cnt[15]~56_combout\,
	cout => \alarm_cnt[15]~57\);

-- Location: FF_X30_Y5_N5
\alarm_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[15]~56_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(15));

-- Location: LCCOMB_X30_Y5_N6
\alarm_cnt[16]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[16]~58_combout\ = (alarm_cnt(16) & (\alarm_cnt[15]~57\ $ (GND))) # (!alarm_cnt(16) & (!\alarm_cnt[15]~57\ & VCC))
-- \alarm_cnt[16]~59\ = CARRY((alarm_cnt(16) & !\alarm_cnt[15]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(16),
	datad => VCC,
	cin => \alarm_cnt[15]~57\,
	combout => \alarm_cnt[16]~58_combout\,
	cout => \alarm_cnt[16]~59\);

-- Location: FF_X30_Y5_N7
\alarm_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[16]~58_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(16));

-- Location: LCCOMB_X30_Y5_N8
\alarm_cnt[17]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[17]~60_combout\ = (alarm_cnt(17) & (!\alarm_cnt[16]~59\)) # (!alarm_cnt(17) & ((\alarm_cnt[16]~59\) # (GND)))
-- \alarm_cnt[17]~61\ = CARRY((!\alarm_cnt[16]~59\) # (!alarm_cnt(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(17),
	datad => VCC,
	cin => \alarm_cnt[16]~59\,
	combout => \alarm_cnt[17]~60_combout\,
	cout => \alarm_cnt[17]~61\);

-- Location: FF_X30_Y5_N9
\alarm_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[17]~60_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(17));

-- Location: LCCOMB_X30_Y5_N10
\alarm_cnt[18]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[18]~62_combout\ = (alarm_cnt(18) & (\alarm_cnt[17]~61\ $ (GND))) # (!alarm_cnt(18) & (!\alarm_cnt[17]~61\ & VCC))
-- \alarm_cnt[18]~63\ = CARRY((alarm_cnt(18) & !\alarm_cnt[17]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(18),
	datad => VCC,
	cin => \alarm_cnt[17]~61\,
	combout => \alarm_cnt[18]~62_combout\,
	cout => \alarm_cnt[18]~63\);

-- Location: FF_X30_Y5_N11
\alarm_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[18]~62_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(18));

-- Location: LCCOMB_X30_Y5_N12
\alarm_cnt[19]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[19]~64_combout\ = (alarm_cnt(19) & (!\alarm_cnt[18]~63\)) # (!alarm_cnt(19) & ((\alarm_cnt[18]~63\) # (GND)))
-- \alarm_cnt[19]~65\ = CARRY((!\alarm_cnt[18]~63\) # (!alarm_cnt(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(19),
	datad => VCC,
	cin => \alarm_cnt[18]~63\,
	combout => \alarm_cnt[19]~64_combout\,
	cout => \alarm_cnt[19]~65\);

-- Location: FF_X30_Y5_N13
\alarm_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[19]~64_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(19));

-- Location: LCCOMB_X30_Y5_N14
\alarm_cnt[20]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[20]~66_combout\ = (alarm_cnt(20) & (\alarm_cnt[19]~65\ $ (GND))) # (!alarm_cnt(20) & (!\alarm_cnt[19]~65\ & VCC))
-- \alarm_cnt[20]~67\ = CARRY((alarm_cnt(20) & !\alarm_cnt[19]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(20),
	datad => VCC,
	cin => \alarm_cnt[19]~65\,
	combout => \alarm_cnt[20]~66_combout\,
	cout => \alarm_cnt[20]~67\);

-- Location: FF_X30_Y5_N15
\alarm_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[20]~66_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(20));

-- Location: LCCOMB_X30_Y5_N16
\alarm_cnt[21]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[21]~70_combout\ = (alarm_cnt(21) & (!\alarm_cnt[20]~67\)) # (!alarm_cnt(21) & ((\alarm_cnt[20]~67\) # (GND)))
-- \alarm_cnt[21]~71\ = CARRY((!\alarm_cnt[20]~67\) # (!alarm_cnt(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(21),
	datad => VCC,
	cin => \alarm_cnt[20]~67\,
	combout => \alarm_cnt[21]~70_combout\,
	cout => \alarm_cnt[21]~71\);

-- Location: FF_X30_Y5_N17
\alarm_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[21]~70_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(21));

-- Location: LCCOMB_X30_Y5_N18
\alarm_cnt[22]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_cnt[22]~72_combout\ = (alarm_cnt(22) & (\alarm_cnt[21]~71\ $ (GND))) # (!alarm_cnt(22) & (!\alarm_cnt[21]~71\ & VCC))
-- \alarm_cnt[22]~73\ = CARRY((alarm_cnt(22) & !\alarm_cnt[21]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => alarm_cnt(22),
	datad => VCC,
	cin => \alarm_cnt[21]~71\,
	combout => \alarm_cnt[22]~72_combout\,
	cout => \alarm_cnt[22]~73\);

-- Location: FF_X30_Y5_N19
\alarm_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[22]~72_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(22));

-- Location: FF_X30_Y5_N21
\alarm_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_cnt[23]~74_combout\,
	sclr => \alarm_cnt[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => alarm_cnt(23));

-- Location: LCCOMB_X29_Y6_N2
\LessThan8~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~10_combout\ = (!alarm_cnt(23) & (!alarm_cnt(24) & (!alarm_cnt(25) & \LessThan8~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => alarm_cnt(23),
	datab => alarm_cnt(24),
	datac => alarm_cnt(25),
	datad => \LessThan8~9_combout\,
	combout => \LessThan8~10_combout\);

-- Location: LCCOMB_X29_Y6_N0
\alarm_toggle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \alarm_toggle~0_combout\ = (\alarm~q\ & (\alarm_toggle~q\ $ (!\LessThan8~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \alarm~q\,
	datac => \alarm_toggle~q\,
	datad => \LessThan8~10_combout\,
	combout => \alarm_toggle~0_combout\);

-- Location: FF_X29_Y6_N1
alarm_toggle : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \alarm_toggle~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alarm_toggle~q\);

-- Location: LCCOMB_X29_Y6_N14
\buzzer~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \buzzer~0_combout\ = (\alarm~q\ & ((\alarm_toggle~q\))) # (!\alarm~q\ & (!\LessThan9~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan9~8_combout\,
	datac => \alarm~q\,
	datad => \alarm_toggle~q\,
	combout => \buzzer~0_combout\);

-- Location: LCCOMB_X26_Y7_N10
\mux_sel[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux_sel[0]~2_combout\ = !\Mux0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux0~0_combout\,
	combout => \mux_sel[0]~2_combout\);

-- Location: LCCOMB_X26_Y5_N0
\count_mux[0]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[0]~16_combout\ = count_mux(0) $ (VCC)
-- \count_mux[0]~17\ = CARRY(count_mux(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_mux(0),
	datad => VCC,
	combout => \count_mux[0]~16_combout\,
	cout => \count_mux[0]~17\);

-- Location: FF_X26_Y5_N1
\count_mux[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[0]~16_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(0));

-- Location: LCCOMB_X26_Y5_N2
\count_mux[1]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[1]~18_combout\ = (count_mux(1) & (!\count_mux[0]~17\)) # (!count_mux(1) & ((\count_mux[0]~17\) # (GND)))
-- \count_mux[1]~19\ = CARRY((!\count_mux[0]~17\) # (!count_mux(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_mux(1),
	datad => VCC,
	cin => \count_mux[0]~17\,
	combout => \count_mux[1]~18_combout\,
	cout => \count_mux[1]~19\);

-- Location: FF_X26_Y5_N3
\count_mux[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[1]~18_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(1));

-- Location: LCCOMB_X26_Y5_N4
\count_mux[2]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[2]~20_combout\ = (count_mux(2) & (\count_mux[1]~19\ $ (GND))) # (!count_mux(2) & (!\count_mux[1]~19\ & VCC))
-- \count_mux[2]~21\ = CARRY((count_mux(2) & !\count_mux[1]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_mux(2),
	datad => VCC,
	cin => \count_mux[1]~19\,
	combout => \count_mux[2]~20_combout\,
	cout => \count_mux[2]~21\);

-- Location: FF_X26_Y5_N5
\count_mux[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[2]~20_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(2));

-- Location: LCCOMB_X26_Y5_N6
\count_mux[3]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[3]~22_combout\ = (count_mux(3) & (!\count_mux[2]~21\)) # (!count_mux(3) & ((\count_mux[2]~21\) # (GND)))
-- \count_mux[3]~23\ = CARRY((!\count_mux[2]~21\) # (!count_mux(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_mux(3),
	datad => VCC,
	cin => \count_mux[2]~21\,
	combout => \count_mux[3]~22_combout\,
	cout => \count_mux[3]~23\);

-- Location: FF_X26_Y5_N7
\count_mux[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[3]~22_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(3));

-- Location: LCCOMB_X26_Y5_N8
\count_mux[4]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[4]~24_combout\ = (count_mux(4) & (\count_mux[3]~23\ $ (GND))) # (!count_mux(4) & (!\count_mux[3]~23\ & VCC))
-- \count_mux[4]~25\ = CARRY((count_mux(4) & !\count_mux[3]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_mux(4),
	datad => VCC,
	cin => \count_mux[3]~23\,
	combout => \count_mux[4]~24_combout\,
	cout => \count_mux[4]~25\);

-- Location: FF_X26_Y5_N9
\count_mux[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[4]~24_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(4));

-- Location: LCCOMB_X26_Y5_N10
\count_mux[5]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[5]~26_combout\ = (count_mux(5) & (!\count_mux[4]~25\)) # (!count_mux(5) & ((\count_mux[4]~25\) # (GND)))
-- \count_mux[5]~27\ = CARRY((!\count_mux[4]~25\) # (!count_mux(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_mux(5),
	datad => VCC,
	cin => \count_mux[4]~25\,
	combout => \count_mux[5]~26_combout\,
	cout => \count_mux[5]~27\);

-- Location: FF_X26_Y5_N11
\count_mux[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[5]~26_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(5));

-- Location: LCCOMB_X26_Y5_N12
\count_mux[6]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[6]~28_combout\ = (count_mux(6) & (\count_mux[5]~27\ $ (GND))) # (!count_mux(6) & (!\count_mux[5]~27\ & VCC))
-- \count_mux[6]~29\ = CARRY((count_mux(6) & !\count_mux[5]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_mux(6),
	datad => VCC,
	cin => \count_mux[5]~27\,
	combout => \count_mux[6]~28_combout\,
	cout => \count_mux[6]~29\);

-- Location: FF_X26_Y5_N13
\count_mux[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[6]~28_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(6));

-- Location: LCCOMB_X26_Y5_N14
\count_mux[7]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[7]~30_combout\ = (count_mux(7) & (!\count_mux[6]~29\)) # (!count_mux(7) & ((\count_mux[6]~29\) # (GND)))
-- \count_mux[7]~31\ = CARRY((!\count_mux[6]~29\) # (!count_mux(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_mux(7),
	datad => VCC,
	cin => \count_mux[6]~29\,
	combout => \count_mux[7]~30_combout\,
	cout => \count_mux[7]~31\);

-- Location: FF_X26_Y5_N15
\count_mux[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[7]~30_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(7));

-- Location: LCCOMB_X26_Y5_N16
\count_mux[8]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[8]~32_combout\ = (count_mux(8) & (\count_mux[7]~31\ $ (GND))) # (!count_mux(8) & (!\count_mux[7]~31\ & VCC))
-- \count_mux[8]~33\ = CARRY((count_mux(8) & !\count_mux[7]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_mux(8),
	datad => VCC,
	cin => \count_mux[7]~31\,
	combout => \count_mux[8]~32_combout\,
	cout => \count_mux[8]~33\);

-- Location: FF_X26_Y5_N17
\count_mux[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[8]~32_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(8));

-- Location: LCCOMB_X26_Y5_N18
\count_mux[9]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[9]~34_combout\ = (count_mux(9) & (!\count_mux[8]~33\)) # (!count_mux(9) & ((\count_mux[8]~33\) # (GND)))
-- \count_mux[9]~35\ = CARRY((!\count_mux[8]~33\) # (!count_mux(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_mux(9),
	datad => VCC,
	cin => \count_mux[8]~33\,
	combout => \count_mux[9]~34_combout\,
	cout => \count_mux[9]~35\);

-- Location: FF_X26_Y5_N19
\count_mux[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[9]~34_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(9));

-- Location: LCCOMB_X26_Y5_N20
\count_mux[10]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[10]~36_combout\ = (count_mux(10) & (\count_mux[9]~35\ $ (GND))) # (!count_mux(10) & (!\count_mux[9]~35\ & VCC))
-- \count_mux[10]~37\ = CARRY((count_mux(10) & !\count_mux[9]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_mux(10),
	datad => VCC,
	cin => \count_mux[9]~35\,
	combout => \count_mux[10]~36_combout\,
	cout => \count_mux[10]~37\);

-- Location: FF_X26_Y5_N21
\count_mux[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[10]~36_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(10));

-- Location: LCCOMB_X26_Y5_N22
\count_mux[11]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[11]~38_combout\ = (count_mux(11) & (!\count_mux[10]~37\)) # (!count_mux(11) & ((\count_mux[10]~37\) # (GND)))
-- \count_mux[11]~39\ = CARRY((!\count_mux[10]~37\) # (!count_mux(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_mux(11),
	datad => VCC,
	cin => \count_mux[10]~37\,
	combout => \count_mux[11]~38_combout\,
	cout => \count_mux[11]~39\);

-- Location: FF_X26_Y5_N23
\count_mux[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[11]~38_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(11));

-- Location: LCCOMB_X26_Y5_N24
\count_mux[12]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[12]~40_combout\ = (count_mux(12) & (\count_mux[11]~39\ $ (GND))) # (!count_mux(12) & (!\count_mux[11]~39\ & VCC))
-- \count_mux[12]~41\ = CARRY((count_mux(12) & !\count_mux[11]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_mux(12),
	datad => VCC,
	cin => \count_mux[11]~39\,
	combout => \count_mux[12]~40_combout\,
	cout => \count_mux[12]~41\);

-- Location: FF_X26_Y5_N25
\count_mux[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[12]~40_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(12));

-- Location: LCCOMB_X26_Y5_N26
\count_mux[13]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[13]~42_combout\ = (count_mux(13) & (!\count_mux[12]~41\)) # (!count_mux(13) & ((\count_mux[12]~41\) # (GND)))
-- \count_mux[13]~43\ = CARRY((!\count_mux[12]~41\) # (!count_mux(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_mux(13),
	datad => VCC,
	cin => \count_mux[12]~41\,
	combout => \count_mux[13]~42_combout\,
	cout => \count_mux[13]~43\);

-- Location: FF_X26_Y5_N27
\count_mux[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[13]~42_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(13));

-- Location: LCCOMB_X25_Y5_N10
\LessThan10~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan10~3_combout\ = (!count_mux(12) & (!count_mux(13) & (!count_mux(10) & !count_mux(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_mux(12),
	datab => count_mux(13),
	datac => count_mux(10),
	datad => count_mux(11),
	combout => \LessThan10~3_combout\);

-- Location: LCCOMB_X26_Y5_N28
\count_mux[14]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[14]~44_combout\ = (count_mux(14) & (\count_mux[13]~43\ $ (GND))) # (!count_mux(14) & (!\count_mux[13]~43\ & VCC))
-- \count_mux[14]~45\ = CARRY((count_mux(14) & !\count_mux[13]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_mux(14),
	datad => VCC,
	cin => \count_mux[13]~43\,
	combout => \count_mux[14]~44_combout\,
	cout => \count_mux[14]~45\);

-- Location: FF_X26_Y5_N29
\count_mux[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[14]~44_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(14));

-- Location: LCCOMB_X26_Y5_N30
\count_mux[15]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_mux[15]~46_combout\ = count_mux(15) $ (\count_mux[14]~45\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_mux(15),
	cin => \count_mux[14]~45\,
	combout => \count_mux[15]~46_combout\);

-- Location: FF_X26_Y5_N31
\count_mux[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_mux[15]~46_combout\,
	sclr => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_mux(15));

-- Location: LCCOMB_X25_Y5_N0
\LessThan10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan10~0_combout\ = (((!count_mux(3)) # (!count_mux(2))) # (!count_mux(0))) # (!count_mux(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_mux(1),
	datab => count_mux(0),
	datac => count_mux(2),
	datad => count_mux(3),
	combout => \LessThan10~0_combout\);

-- Location: LCCOMB_X25_Y5_N22
\LessThan10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan10~1_combout\ = ((!count_mux(5) & (!count_mux(4) & \LessThan10~0_combout\))) # (!count_mux(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_mux(6),
	datab => count_mux(5),
	datac => count_mux(4),
	datad => \LessThan10~0_combout\,
	combout => \LessThan10~1_combout\);

-- Location: LCCOMB_X25_Y5_N28
\LessThan10~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan10~2_combout\ = (((!count_mux(7) & \LessThan10~1_combout\)) # (!count_mux(9))) # (!count_mux(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_mux(7),
	datab => count_mux(8),
	datac => \LessThan10~1_combout\,
	datad => count_mux(9),
	combout => \LessThan10~2_combout\);

-- Location: LCCOMB_X25_Y5_N20
\LessThan10~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan10~4_combout\ = (count_mux(14) & (count_mux(15) & ((!\LessThan10~2_combout\) # (!\LessThan10~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan10~3_combout\,
	datab => count_mux(14),
	datac => count_mux(15),
	datad => \LessThan10~2_combout\,
	combout => \LessThan10~4_combout\);

-- Location: FF_X26_Y7_N11
\mux_sel[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mux_sel[0]~2_combout\,
	ena => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mux_sel(0));

-- Location: LCCOMB_X26_Y7_N8
\mux_sel~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux_sel~0_combout\ = (!mux_sel(1) & mux_sel(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => mux_sel(1),
	datad => mux_sel(0),
	combout => \mux_sel~0_combout\);

-- Location: FF_X26_Y7_N9
\mux_sel[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mux_sel~0_combout\,
	ena => \LessThan10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mux_sel(1));

-- Location: LCCOMB_X26_Y7_N0
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (mux_sel(1)) # (mux_sel(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => mux_sel(1),
	datad => mux_sel(0),
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X26_Y7_N4
\sel[0]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \sel[0]~reg0feeder_combout\ = \Mux0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux0~0_combout\,
	combout => \sel[0]~reg0feeder_combout\);

-- Location: FF_X26_Y7_N5
\sel[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sel[0]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sel[0]~reg0_q\);

-- Location: LCCOMB_X28_Y7_N8
\sel[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sel[1]~0_combout\ = !mux_sel(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => mux_sel(0),
	combout => \sel[1]~0_combout\);

-- Location: FF_X28_Y7_N9
\sel[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sel[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sel[1]~reg0_q\);

-- Location: LCCOMB_X26_Y7_N6
\sel[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sel[2]~1_combout\ = !mux_sel(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => mux_sel(1),
	combout => \sel[2]~1_combout\);

-- Location: FF_X26_Y7_N7
\sel[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sel[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sel[2]~reg0_q\);

-- Location: LCCOMB_X25_Y10_N26
\current_bcd[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_bcd[2]~2_combout\ = (mux_sel(0) & ((sec_dez(2)))) # (!mux_sel(0) & (sec_uni(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_uni(2),
	datab => sec_dez(2),
	datad => mux_sel(0),
	combout => \current_bcd[2]~2_combout\);

-- Location: FF_X25_Y10_N27
\current_bcd[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current_bcd[2]~2_combout\,
	asdata => min_uni(2),
	sload => mux_sel(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_bcd(2));

-- Location: LCCOMB_X25_Y10_N2
\current_bcd[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_bcd[0]~0_combout\ = (mux_sel(0) & ((sec_dez(0)))) # (!mux_sel(0) & (sec_uni(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sec_uni(0),
	datab => sec_dez(0),
	datad => mux_sel(0),
	combout => \current_bcd[0]~0_combout\);

-- Location: FF_X25_Y10_N3
\current_bcd[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current_bcd[0]~0_combout\,
	asdata => min_uni(0),
	sload => mux_sel(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_bcd(0));

-- Location: LCCOMB_X24_Y10_N20
\Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!mux_sel(0) & ((mux_sel(1) & ((min_uni(3)))) # (!mux_sel(1) & (sec_uni(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => mux_sel(1),
	datab => mux_sel(0),
	datac => sec_uni(3),
	datad => min_uni(3),
	combout => \Mux1~0_combout\);

-- Location: FF_X24_Y10_N21
\current_bcd[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_bcd(3));

-- Location: LCCOMB_X25_Y10_N18
\current_bcd[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_bcd[1]~1_combout\ = (mux_sel(0) & (sec_dez(1))) # (!mux_sel(0) & ((sec_uni(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => mux_sel(0),
	datab => sec_dez(1),
	datad => sec_uni(1),
	combout => \current_bcd[1]~1_combout\);

-- Location: FF_X25_Y10_N19
\current_bcd[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current_bcd[1]~1_combout\,
	asdata => min_uni(1),
	sload => mux_sel(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_bcd(1));

-- Location: LCCOMB_X32_Y4_N28
\Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (!current_bcd(3) & (!current_bcd(1) & (current_bcd(2) $ (current_bcd(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_bcd(2),
	datab => current_bcd(0),
	datac => current_bcd(3),
	datad => current_bcd(1),
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X32_Y4_N14
\Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (current_bcd(2) & (current_bcd(0) $ (current_bcd(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => current_bcd(0),
	datac => current_bcd(2),
	datad => current_bcd(1),
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X32_Y4_N0
\Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (!current_bcd(0) & (!current_bcd(2) & current_bcd(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => current_bcd(0),
	datac => current_bcd(2),
	datad => current_bcd(1),
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X32_Y4_N26
\Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (!current_bcd(3) & ((current_bcd(2) & (current_bcd(0) $ (!current_bcd(1)))) # (!current_bcd(2) & (current_bcd(0) & !current_bcd(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_bcd(2),
	datab => current_bcd(0),
	datac => current_bcd(3),
	datad => current_bcd(1),
	combout => \Mux8~0_combout\);

-- Location: LCCOMB_X32_Y4_N24
\Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (current_bcd(0)) # ((current_bcd(2) & !current_bcd(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => current_bcd(0),
	datac => current_bcd(2),
	datad => current_bcd(1),
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X32_Y4_N30
\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (!current_bcd(3) & ((current_bcd(2) & (current_bcd(0) & current_bcd(1))) # (!current_bcd(2) & ((current_bcd(0)) # (current_bcd(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_bcd(2),
	datab => current_bcd(0),
	datac => current_bcd(3),
	datad => current_bcd(1),
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X32_Y4_N12
\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (current_bcd(3)) # ((current_bcd(2) & ((!current_bcd(1)) # (!current_bcd(0)))) # (!current_bcd(2) & ((current_bcd(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_bcd(2),
	datab => current_bcd(0),
	datac => current_bcd(3),
	datad => current_bcd(1),
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X33_Y5_N24
\dp~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dp~feeder_combout\ = mux_sel(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => mux_sel(1),
	combout => \dp~feeder_combout\);

-- Location: FF_X33_Y5_N25
dp : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \dp~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dp~q\);

ww_buzzer <= \buzzer~output_o\;

ww_sel(0) <= \sel[0]~output_o\;

ww_sel(1) <= \sel[1]~output_o\;

ww_sel(2) <= \sel[2]~output_o\;

ww_sel(3) <= \sel[3]~output_o\;

ww_sel(4) <= \sel[4]~output_o\;

ww_sel(5) <= \sel[5]~output_o\;

ww_dig(0) <= \dig[0]~output_o\;

ww_dig(1) <= \dig[1]~output_o\;

ww_dig(2) <= \dig[2]~output_o\;

ww_dig(3) <= \dig[3]~output_o\;

ww_dig(4) <= \dig[4]~output_o\;

ww_dig(5) <= \dig[5]~output_o\;

ww_dig(6) <= \dig[6]~output_o\;

ww_dig(7) <= \dig[7]~output_o\;
END structure;


