LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

library work;
use work.testVectors.all;

ENTITY detectsReleasedKey IS
END detectsReleasedKey;
 
ARCHITECTURE behavior OF detectsReleasedKey IS 

	COMPONENT ps2ToBeeb
	PORT(
		ps2_clk  : IN std_logic;
		ps2_data : IN std_logic;
		beeb_clk : IN std_logic;          
		beeb_row : OUT std_logic_vector(2 downto 0);
		beeb_col : OUT std_logic_vector(3 downto 0);
		beeb_keydown : OUT std_logic;
		beeb_shiftState : OUT std_logic;
		beeb_ctrlState : OUT std_logic
		);
	END COMPONENT;

	signal ps2_clk : std_logic := '0';
	signal ps2_data : std_logic := '0';
	signal beeb_clk : std_logic := '0';
	signal beeb_row : std_logic_vector(2 downto 0);
	signal beeb_col : std_logic_vector(3 downto 0);
	signal beeb_keydown : std_logic;

	constant beeb_clk_period : time := 1000 ns;
BEGIN
 
	uut: ps2ToBeeb PORT MAP (
		ps2_clk => ps2_clk, ps2_data => ps2_data, 
		beeb_clk => beeb_clk,
		beeb_row => beeb_row, beeb_col => beeb_col,
		beeb_keydown => beeb_keydown
	);

	-- The 1MHz clock the beeb provides
	beeb_clk_process :process
	begin
		beeb_clk <= '0'; wait for beeb_clk_period/2;
		beeb_clk <= '1'; wait for beeb_clk_period/2;
	end process;

	stim_proc: process
	begin
		-- idle the line
		ps2_clk <= '1'; ps2_data <= '1';
		
		-- Wait long enough that our ps2 code resets the ps2 data line
		wait for beeb_clk_period * 1024;
		
		-- Send a space, as captured from keyboard hardware
		work.testVectors.ps2_synthetic_keydown_digit9(ps2_clk, ps2_data);

		wait for beeb_clk_period * 2;
		wait for beeb_clk_period * 2;
		wait for beeb_clk_period * 2;

		-- We should see this key pressed.
		assert beeb_keydown = '1' report "key not reported as pressed" severity FAILURE;
		assert beeb_row = "010" report "Wrong row for pressed key" severity FAILURE;
		assert beeb_col = "0101" report "wrong column for pressed key" severity FAILURE;

		-- Wait for a while, making sure the key is nor released prematurely
		wait for beeb_clk_period * 100;
		assert beeb_keydown = '1' report "key reported as not-pressed prematurely" severity FAILURE;
		assert beeb_row = "010" report "row changed prematurely" severity FAILURE;
		assert beeb_col = "0101" report "column changed prematurely" severity FAILURE;

		-- Now release the key.
		work.testVectors.ps2_synthetic_keyup_spacebar(ps2_clk, ps2_data);
		wait for beeb_clk_period * 1024;

		-- the keydown signal should now be deasserted.
		assert beeb_keydown = '0' report "Key not reported as released" severity FAILURE;


		report "all OK" severity FAILURE;
	end process;

END;
