LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY signalsInterrupt IS
END signalsInterrupt;
 
ARCHITECTURE behavior OF signalsInterrupt IS 
 
    COMPONENT kb
    PORT(
         ROW : IN  std_logic_vector(2 downto 0);
         COL : IN  std_logic_vector(3 downto 0);
         CA2 : OUT  std_logic;
         W : OUT  std_logic;
         CB : IN  std_logic;
         RST : OUT  std_logic;
			
			startupOptions: in STD_LOGIC_VECTOR(7 downto 0);
			
         beeb_clk : IN  std_logic;
         ps2_clk  : IN  std_logic;
         ps2_data : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ROW : std_logic_vector(2 downto 0) := (others => '0');
   signal COL : std_logic_vector(3 downto 0) := (others => '0');
   signal CB : std_logic := '0';
	signal startupOptions: STD_LOGIC_VECTOR(7 downto 0);
   signal beeb_clk  : std_logic := '0';
   signal ps2_clk : std_logic := '0';
   signal ps2_data: std_logic := '0';

 	--Outputs
   signal CA2 : std_logic;
   signal W : std_logic;
   signal RST : std_logic;

   -- Clock period definitions
   constant clk_period : time := (1000 ms / 1000000);
   constant ps2_clk_period : time := 100 ns;
 
	signal sawInterrupt: integer;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: kb PORT MAP (
          ROW => ROW,
          COL => COL,
          CA2 => CA2,
          W => W,
          CB => CB,
          RST => RST,
			 startupOptions => startupOptions,
			 
          beeb_clk => beeb_clk,
			 ps2_clk  => ps2_clk,
			 ps2_data => ps2_data
        );

   clk_process :process
   begin
		beeb_clk <= '0'; wait for clk_period/2;
		beeb_clk <= '1'; wait for clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin
		ps2_clk <= '1';
		
		-- When CB is high, we're in free-scanning mode. Row and column should be ignored.
		ROW <= (others => 'X');
		COL <= (others => 'X');
		CB <= '1';
		wait for clk_period * 2;
		-- No keys down means that CA2 should be deasserted.
		assert CA2 = '0' severity FAILURE; 
		
		-- Now press a key.
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

		-- We should see an interrupt within 16 clock cycles.
		sawInterrupt <= 0;
		for i in 0 to 16 loop
			wait for clk_period;
			if (ca2 = '1') then
				sawInterrupt <= sawInterrupt + 1;
			end if;
		end loop;
		assert sawInterrupt = 1 severity FAILURE;
		
		report "all OK" severity FAILURE;
   end process;

END;
