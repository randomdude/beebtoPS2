LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY signalsInterrupt IS
END signalsInterrupt;
 
ARCHITECTURE behavior OF signalsInterrupt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT kb
    PORT(
         ROW : IN  std_logic_vector(2 downto 0);
         COL : IN  std_logic_vector(3 downto 0);
         CA2 : OUT  std_logic;
         W : OUT  std_logic;
         CB : IN  std_logic;
         RST : OUT  std_logic;
			dbgbtn: in  STD_LOGIC;
			
         clk : IN  std_logic;
			clk50mhz : in  STD_LOGIC;
         rs232in : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ROW : std_logic_vector(2 downto 0) := (others => '0');
   signal COL : std_logic_vector(3 downto 0) := (others => '0');
   signal CB : std_logic := '0';
   signal clk : std_logic := '0';
   signal clk50mhz  : std_logic := '0';
   signal rs232in : std_logic := '0';

 	--Outputs
   signal CA2 : std_logic;
   signal W : std_logic;
   signal RST : std_logic;

   -- Clock period definitions
   constant clk_period : time := (1000 ms / 1000000);
   constant clk50_period : time := (1000 ms / 50000000);
 
 
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
			 dbgbtn => '0',
			 
          clk => clk,
			 clk50mhz => clk50mhz,
          rs232in => rs232in
        );

   clk_process :process
   begin
		clk <= '0'; wait for clk_period/2;
		clk <= '1'; wait for clk_period/2;
   end process;

   clk50_process :process
   begin
		clk50mhz  <= '0'; wait for clk50_period/2;
		clk50mhz  <= '1'; wait for clk50_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		rs232in <= '1';
		
		-- When CB is high, we're in free-scanning mode. Row and column should be ignored.
		ROW <= (others => 'X');
		COL <= (others => 'X');
		CB <= '1';
		wait for clk_period * 2;
		-- No keys down means that CA2 should be deasserted.
		assert CA2 = '0' severity FAILURE; 
		
		-- Now press a key.
		rs232in <= '0'; wait for 1000 ms / 9600;

		rs232in <= '0'; wait for 1000 ms / 9600;
		rs232in <= '0'; wait for 1000 ms / 9600;
		rs232in <= '0'; wait for 1000 ms / 9600;
		rs232in <= '1'; wait for 1000 ms / 9600;
		rs232in <= '0'; wait for 1000 ms / 9600;
		rs232in <= '0'; wait for 1000 ms / 9600;
		rs232in <= '0'; wait for 1000 ms / 9600;
		rs232in <= '1'; wait for 1000 ms / 9600;
		
		rs232in <= '1'; wait for 1000 ms / 9600;
		
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
