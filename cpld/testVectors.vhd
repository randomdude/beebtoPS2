library IEEE;
use IEEE.STD_LOGIC_1164.all;

package testVectors is
	procedure ps2_keydown_spacebar (signal ps2_clk: out std_logic; signal ps2_data: out std_logic);
end testVectors;

package body testVectors is

  procedure ps2_keydown_spacebar (signal ps2_clk: out std_logic; signal ps2_data: out std_logic) is
	begin
		-- Send a space, as captured from keyboard hardware
		wait for 4490.000000 ns; ps2_data <= '0';
		-- start bit
		wait for 150.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';
		
		wait for 230.000000 ns;  ps2_data <= '1';
		wait for 140.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';
		
		wait for 230.000000 ns;  ps2_data <= '0';
		wait for 160.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';
		
		wait for 380.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';
		
		wait for 230.000000 ns;  ps2_data <= '1';
		wait for 150.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';
		
		wait for 230.000000 ns;  ps2_data <= '0';
		wait for 150.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';
		
		wait for 230.000000 ns;  ps2_data <= '1';
		wait for 150.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';
		
		wait for 230.000000 ns;  ps2_data <= '0';
		wait for 150.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';
		
		wait for 390.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';
		
		-- Parity
		wait for 380.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';
		
		-- Stop bit
		wait for 240.000000 ns;  ps2_data <= '1';
		wait for 150.000000 ns;  ps2_clk <= '0';
		wait for 390.000000 ns;  ps2_clk <= '1';    
  end ps2_keydown_spacebar;
 
end testVectors;
