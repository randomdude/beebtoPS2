library IEEE;
use IEEE.STD_LOGIC_1164.all;

package testVectors is
	procedure ps2_keydown_spacebar (signal ps2_clk: out std_logic; signal ps2_data: out std_logic);
	procedure ps2_synthetic_keydown_spacebar (signal ps2_clk: out std_logic; signal ps2_data: out std_logic);
	procedure ps2_synthetic_keyup_spacebar (signal ps2_clk: out std_logic; signal ps2_data: out std_logic);
end testVectors;

package body testVectors is

  procedure ps2_keydown_spacebar (signal ps2_clk: out std_logic; signal ps2_data: out std_logic) is
	begin
		-- Send a space, as captured from keyboard hardware
		wait for 4490.000000 ns; ps2_data <= '0';
		-- start bit
		wait for 1500.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';
		
		wait for 2300.000000 ns;  ps2_data <= '1';
		wait for 1400.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';
		
		wait for 2300.000000 ns;  ps2_data <= '0';
		wait for 1600.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';
		
		wait for 3800.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';
		
		wait for 2300.000000 ns;  ps2_data <= '1';
		wait for 1500.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';
		
		wait for 2300.000000 ns;  ps2_data <= '0';
		wait for 1500.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';
		
		wait for 2300.000000 ns;  ps2_data <= '1';
		wait for 1500.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';
		
		wait for 2300.000000 ns;  ps2_data <= '0';
		wait for 1500.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';
		
		wait for 3900.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';
		
		-- Parity
		wait for 3800.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';
		
		-- Stop bit
		wait for 2400.000000 ns;  ps2_data <= '1';
		wait for 1500.000000 ns;  ps2_clk <= '0';
		wait for 3900.000000 ns;  ps2_clk <= '1';    
  end ps2_keydown_spacebar;

  procedure ps2_synthetic_keydown_spacebar (signal ps2_clk: out std_logic; signal ps2_data: out std_logic) is
	begin
		-- Send a space, as calculated from the spec
		-- start bit
		wait for 4490.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		-- data bits - 0x29, 0b00101001
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		
		-- Parity
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		
		-- Stop bit
		wait for 2400.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';    
  end ps2_synthetic_keydown_spacebar;

  procedure ps2_synthetic_keyup_spacebar (signal ps2_clk: out std_logic; signal ps2_data: out std_logic) is
	begin
		-- Send a space keyup, as calculated from the spec
		-- start bit
		wait for 4490.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		-- data bits: 0xF0
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		
		-- Parity
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		
		-- Stop bit
		wait for 2400.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';    

		-- start bit
		wait for 4490.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		-- data bits
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		
		-- Parity
		wait for 2300.000000 ns;  ps2_data <= '0'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';
		
		-- Stop bit
		wait for 2400.000000 ns;  ps2_data <= '1'; wait for 1500.000000 ns;  ps2_clk <= '0'; wait for 3900.000000 ns;  ps2_clk <= '1';    
  end ps2_synthetic_keyup_spacebar;
  
end testVectors;
