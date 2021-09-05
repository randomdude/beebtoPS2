LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

library work;
use work.testVectors.all;
 
ENTITY ps2_recievesOK IS
END ps2_recievesOK;
 
ARCHITECTURE behavior OF ps2_recievesOK IS 
 
	COMPONENT ps2ToBeeb
	PORT(
		fast_clk : IN std_logic;
		ps2_clk  : IN std_logic;
		ps2_data : IN std_logic;
		beeb_clk : IN std_logic;          
		beeb_row : OUT std_logic_vector(2 downto 0);
		beeb_col : OUT std_logic_vector(3 downto 0);
		beeb_keydown : OUT std_logic;
		beeb_shiftState : OUT std_logic;
		beeb_ctrlState : OUT std_logic;
		dbgleds : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

   --Inputs
   signal fast_clk : std_logic := '0';
   signal ps2_clk : std_logic := '0';
   signal ps2_data : std_logic := '0';
   signal beeb_clk : std_logic := '0';

 	--Outputs
   signal beeb_row : std_logic_vector(2 downto 0);
   signal beeb_col : std_logic_vector(3 downto 0);
   signal beeb_keydown : std_logic;

   constant fast_clk_period : time := 20 ns;
   constant beeb_clk_period : time := 1000 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ps2ToBeeb PORT MAP (
          ps2_clk => ps2_clk, ps2_data => ps2_data, 
          fast_clk => fast_clk, beeb_clk => beeb_clk,
          beeb_row => beeb_row, beeb_col => beeb_col,
          beeb_keydown => beeb_keydown
        );

	-- The 1MHz clock the beeb provides
	beeb_clk_process :process
	begin
		beeb_clk <= '0'; wait for beeb_clk_period/2;
		beeb_clk <= '1'; wait for beeb_clk_period/2;
	end process;

	-- The fast clock, at some 50MHz
	fast_clk_process :process
	begin
		fast_clk <= '0'; wait for fast_clk_period/2;
		fast_clk <= '1'; wait for fast_clk_period/2;
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
		-- idle the line
		ps2_clk <= '1'; ps2_data <= '1';
		
		-- Send a space, as captured from keyboard hardware
		work.testVectors.ps2_keydown_spacebar(ps2_clk, ps2_data);

		-- We should see this key pressed.
		assert beeb_keydown = '1' severity FAILURE;		
		assert beeb_row = "110" severity FAILURE;		
		assert beeb_col = "0010" severity FAILURE;		

		report "all OK" severity FAILURE;
   end process;

END;
