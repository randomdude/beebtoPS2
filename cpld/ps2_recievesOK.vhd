LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ps2_recievesOK IS
END ps2_recievesOK;
 
ARCHITECTURE behavior OF ps2_recievesOK IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ps2ToBeeb
    PORT(
         ps2_clk : IN  std_logic;
         ps2_data : IN  std_logic;
         beeb_clk : IN  std_logic;
         beeb_row : OUT  std_logic_vector(2 downto 0);
         beeb_col : OUT  std_logic_vector(3 downto 0);
         beeb_keydown : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ps2_clk : std_logic := '0';
   signal ps2_data : std_logic := '0';
   signal beeb_clk : std_logic := '0';

 	--Outputs
   signal beeb_row : std_logic_vector(2 downto 0);
   signal beeb_col : std_logic_vector(3 downto 0);
   signal beeb_keydown : std_logic;

   constant beeb_clk_period : time := 10 ns;
   constant ps2_clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ps2ToBeeb PORT MAP (
          ps2_clk => ps2_clk,
          ps2_data => ps2_data,
          beeb_clk => beeb_clk,
          beeb_row => beeb_row,
          beeb_col => beeb_col,
          beeb_keydown => beeb_keydown
        );

   beeb_clk_process :process
   begin
		beeb_clk <= '0';
		wait for beeb_clk_period/2;
		beeb_clk <= '1';
		wait for beeb_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		-- idle the line
		ps2_clk <= '1'; ps2_data <= '1'; wait for 100 us;	

		-- start bit
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;

		-- data bits
		ps2_clk <= '0'; ps2_data <= '1'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '1'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '1'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;

		-- Parity and stop bit
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;

		assert beeb_keydown = '1' severity FAILURE;		
		assert beeb_row = "010" severity FAILURE;		
		assert beeb_col = "0111" severity FAILURE;		

		report "testing Jenkins!" severity FAILURE;

		-- idle the line
		ps2_clk <= '1'; ps2_data <= '1'; wait for 60 us;	
		-- start bit
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		-- data bits
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '1'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '1'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '1'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '1'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		-- Parity and stop bit
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		-- idle the line
		ps2_clk <= '1'; ps2_data <= '1'; wait for 60 us;	
		-- start bit
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		-- data bits
		ps2_clk <= '0'; ps2_data <= '1'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '1'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '1'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		-- Parity and stop bit
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;
		ps2_clk <= '0'; ps2_data <= '0'; wait for ps2_clk_period*2; ps2_clk <= '1'; wait for ps2_clk_period*2;

		assert beeb_keydown = '0' severity FAILURE;

		report "all OK" severity FAILURE;
   end process;

END;
