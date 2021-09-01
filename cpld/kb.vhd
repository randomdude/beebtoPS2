library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity kb is
    Port ( ROW : in  STD_LOGIC_VECTOR (2 downto 0);
           COL : in  STD_LOGIC_VECTOR (3 downto 0);
			  CA2 : out STD_LOGIC;
			  W   : out STD_LOGIC;
			  CB  : in  STD_LOGIC;
           RST : out STD_LOGIC;
	
			  dbgleds: out  STD_LOGIC_VECTOR (9 downto 0);

			  startupOptions: in STD_LOGIC_VECTOR(7 downto 0);

			  beeb_clk : in  STD_LOGIC;
			  ps2_clk: in STD_LOGIC;
			  ps2_data: in STD_LOGIC
			  );
end kb;
architecture Behavioral of kb is

	COMPONENT ps2ToBeeb
	PORT(
		ps2_clk : IN  std_logic;
		ps2_data : IN  std_logic;
		beeb_clk : IN  std_logic;
		beeb_row : OUT  std_logic_vector(2 downto 0);
		beeb_col : OUT  std_logic_vector(3 downto 0);
		beeb_keydown : OUT  std_logic;
		beeb_shiftState : OUT  std_logic;
		beeb_ctrlState : OUT  std_logic;

		dbgleds: OUT  std_logic_vector(9 downto 0)
	  );
	END COMPONENT;

	signal latchedCol: std_logic_vector(3 downto 0) := "0000";
	signal byteIn: std_logic_vector(7 downto 0);
	signal bitCount: std_logic_vector(10 downto 0) := "10000000000";

	signal beeb_row: std_logic_vector(2 downto 0);
	signal beeb_col: std_logic_vector(3 downto 0);
	signal beeb_keydown: std_logic;
	-- status of modifier keys
	signal beeb_shiftState: std_logic;
	signal beeb_ctrlState: std_logic;

	signal led_dummy: std_logic_vector(9 downto 0);
	
	signal cnt: std_logic_vector(14 downto 0) := "000000000000000";
begin

Inst_ps2ToBeeb: ps2ToBeeb PORT MAP (
		 ps2_clk => ps2_clk,
		 ps2_data => ps2_data,
		 beeb_clk => beeb_clk ,
		 beeb_row => beeb_row,
		 beeb_col => beeb_col,
		 beeb_keydown => beeb_keydown,
		 beeb_shiftState => beeb_shiftState,
		 beeb_ctrlState => beeb_ctrlState,
		 dbgleds => led_dummy
	  );
	  
-- Debug LEDs. The first bit is illuminated if a non-modifier key is pressed,
-- the second and third if shift or ctl is currently pressed, and the remainer
-- show the current col/row state.
--dbgleds (4 downto 1) <= ps2dbg;
--dbgleds(1) <= beeb_keydown;
--dbgleds(9 downto 5) <= "00000";
--dbgleds(1) <= beeb_shiftState;
--dbgleds(2) <= beeb_ctrlState;
--dbgleds(4 downto 1) <= latchedCol;

dbgleds(0) <= beeb_ctrlState;
dbgleds(1) <= beeb_keydown;
dbgleds(9 downto 2) <= beeb_row & '0' & beeb_col;

process(beeb_clk, CB, COL, ROW, byteIn)
begin
	if rising_edge(beeb_clk) then
		cnt <= cnt + 1;

		if CB = '0' then
			-- IC2 (row decoder) is enabled, IC1 (row counter) is loaded from keyboard column input lines.
			latchedCol <= COL;
		else
			-- IC2 (Row decoder) is disabled. IC1 (column counter) is free-running.
			latchedCol <= latchedCol + 1;
		end if;
		
		if CB = '1' then
			-- While CB is high, IC2 (column decoder) is disabled.
			W <= 'Z';
		else
			-- We handle the bottom row ourselves. This row contains modifier key states, and
			-- the startup options.
			if ROW = 000 then 
				case latchedCol is
				
					when "0000" => W <= beeb_shiftState;
					when "0001" => W <= beeb_ctrlState;
					-- These are the sw2 startup options.
					when "0010" => W <= startupOptions(7);
					when "0011" => W <= startupOptions(6);
					when "0100" => W <= startupOptions(5);
					when "0101" => W <= startupOptions(4);
					when "0110" => W <= startupOptions(3);
					when "0111" => W <= startupOptions(2);
					when "1000" => W <= startupOptions(1);
					when "1001" => W <= startupOptions(0);
					when others => W <= '0';
				end case;
			else 
				if latchedCol = beeb_col and beeb_keydown = '1' then
					W <= '1';
				else
					W <= '0';
				end if;
			end if;
		end if;
	
		-- Set the interrupt line if any key is pressed in this column.
		if latchedCol = beeb_col and beeb_keydown = '1' then
			CA2 <= '1';
		else
			CA2 <= '0';
		end if;

	end if;
end process;

end Behavioral;

