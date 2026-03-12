----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2026 10:50:23 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is      
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is
    component sevenseg_decoder is
        port (
            An   : out std_logic_vector(3 downto 0);
            o_seg_n     : out std_logic_vector(6 downto 0);
            i_Hex    : in std_logic_vector(3 downto 0);
            btnC : in std_logic
            );
     end component;
     signal w_btnC: std_logic:= '0';
     signal w_An : std_logic_vector(3 downto 0);
     signal w_seg_n : std_logic_vector(6 downto 0);
     signal w_sw : std_logic_vector (3 downto 0):= (others=> '0');
begin
sevenseg_decoder_tb_inst: sevenseg_decoder
port map(
    i_Hex =>w_sw,
    o_seg_n => w_seg_n,
    An => w_An,
    btnC => w_btnC
    );
test_process: process
begin
    w_btnC <= '0';
    w_sw <= x"0"; 
    wait for 10 ns;
        assert w_An = "1111" report "Anodes inactive btnC=0"
        severity failure;
    w_btnC <= '1';
    w_sw <= x"0";
    wait for 10 ns;
        assert w_seg_n = "1000000" report "error on 0" 
        severity failure;
    w_sw <= x"1"; 
    wait for 10 ns;
        assert w_seg_n = "1111001" report "Anodes inactive btnC=0"
        severity failure;
    w_btnC <= '1';
    w_sw <= x"2";
    wait for 10 ns;
        assert w_seg_n = "0100100" report "error on 0" 
        severity failure;
    w_sw <= x"3"; 
    wait for 10 ns;
        assert w_seg_n = "0110000" report "Anodes inactive btnC=0"
        severity failure;
    w_btnC <= '1';
    w_sw <= x"4";
    wait for 10 ns;
        assert w_seg_n = "0011001" report "error on 0" 
        severity failure;
    w_sw <= x"8"; 
    wait for 10 ns;
        assert w_seg_n = "0000000" report "Anodes inactive btnC=0"
        severity failure;
    w_btnC <= '1';
    w_sw <= x"F";
    wait for 10 ns;
        assert w_seg_n = "0001110" report "error on 0" 
        severity failure;
    wait;
end process;
end Behavioral;
