LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

library work;
use work.testVectors.all;

ENTITY all_keypress IS
END all_keypress;
 

ARCHITECTURE behavior OF all_keypress IS 
 
	COMPONENT kb
		PORT(
			ROW : IN  std_logic_vector(2 downto 0);
			COL : IN  std_logic_vector(3 downto 0);
			CA2 : OUT  std_logic;
			W : OUT  std_logic;
			W_EN: out STD_LOGIC;
			CB : IN  std_logic;
			startupOptions: in STD_LOGIC_VECTOR(7 downto 0);

			beeb_clk : IN  std_logic;
			ps2_clk  : IN  std_logic;
			ps2_data : IN  std_logic
			);
	END COMPONENT;

	signal ROW : std_logic_vector(2 downto 0) := (others => '0');
	signal COL : std_logic_vector(3 downto 0) := (others => '0');
	signal CB : std_logic := '0';
	signal startupOptions: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

	signal beeb_clk  : std_logic := '0';
	signal ps2_clk : std_logic := '0';
	signal ps2_data: std_logic := '0';
	signal CA2 : std_logic;
	signal W : std_logic;
	signal W_EN : std_logic;

	constant beeb_clk_period : time := 955 ns;
 
	signal sawInterrupt: integer;
BEGIN
 
	uut: kb PORT MAP (
		ROW => ROW, COL => COL,
		CA2 => CA2, W => W, W_EN => W_EN,
		CB => CB,
		startupOptions => startupOptions,
		beeb_clk => beeb_clk,
		ps2_clk  => ps2_clk, ps2_data => ps2_data
	);

	-- the beeb clock runs at 1mhz constantly
	clk_process :process
	begin
		beeb_clk <= '0'; wait for beeb_clk_period/2;
		beeb_clk <= '1'; wait for beeb_clk_period/2;
	end process;

	stim_proc: process
	begin
		ps2_clk <= '1';
		
		wait for beeb_clk_period * 1024;
		
		-- When CB is high, we're in free-scanning mode. Row and column should be ignored.
		COL <= (others => '0');
		ROW <= (others => '0');
		CB <= '0';
		wait for beeb_clk_period * 2;
		COL <= (others => '0');
		ROW <= (others => '0');
		CB <= '1';
		wait for beeb_clk_period * 2;
		-- No keys down means that CA2 should be deasserted.
		assert CA2 = '0' report "CA asserted when no keys pressed" severity FAILURE; 
		
		-- Now idle the line, and then press a key.
		ps2_clk <= '1'; ps2_data <= '1'; wait for 100 us;	
		work.testVectors.ps2_synthetic_keydown_digit9(ps2_clk, ps2_data);

		-- We should see an interrupt within 16 clock cycles.
		sawInterrupt <= 0;
		for i in 0 to 16 loop
			wait for beeb_clk_period;
			if (ca2 = '1') then
				sawInterrupt <= sawInterrupt + 1;
			end if;
		end loop;
		assert sawInterrupt = 1 report "interrupt not asserted" severity FAILURE;
		
		-- Now interrogate the uut from the BBC-micro side.
		-- with CB low, we should see CA2 go high when we observe column 2.
		CB <= '0';
		COL <= x"0";
		wait for beeb_clk_period;
		wait for beeb_clk_period;
		assert ca2 = '0' report "beeb did not deassert CA2 when CB=0 and a non-0b0010 row was present" severity FAILURE;
		COL <= x"5";
		wait for beeb_clk_period;
		assert ca2 = '1' report "beeb did not assert CA2 when CB=0 and the correct 0b0010 row was present" severity FAILURE ;

		-- Now make sure 'W' is asserted when the correct row is selected.
		assert W_EN = '0' report "beeb asserted W when non-selected row present" severity FAILURE ;
		wait for beeb_clk_period;
		CB <= '1';
		ROW <= b"010";
		wait for beeb_clk_period;
		assert W_EN = '1' report "beeb did not assert W when selected row present" severity FAILURE ;

		
		report "all OK" severity FAILURE;
	end process;

END;
