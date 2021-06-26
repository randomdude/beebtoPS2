LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY rs232_recvByte IS
END rs232_recvByte;
 
ARCHITECTURE behavior OF rs232_recvByte IS 
 
    COMPONENT rs232
    PORT(
         clk50mhz : IN  std_logic;
         rs232in : IN  std_logic;
         keydata : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   signal clk50mhz : std_logic := '0';
   signal rs232in : std_logic := '0';
   signal keydata : std_logic_vector(7 downto 0);
   constant clk50mhz_period : time := 20 ns;
 
   constant bit_period : time := 104 us;
BEGIN
 
   uut: rs232 PORT MAP (
          clk50mhz => clk50mhz,
          rs232in => rs232in,
          keydata => keydata
        );

   clk50mhz_process :process
   begin
		clk50mhz <= '0';
		wait for clk50mhz_period/2;
		clk50mhz <= '1';
		wait for clk50mhz_period/2;
   end process;
 

   stim_proc: process
   begin		
      -- Idle the line
		rs232in <= '1';
      wait for clk50mhz_period * 10;

		-- Now send a byte.
		rs232in <= '0';	-- Start bit
		wait for bit_period;
		rs232in <= '1';
		wait for bit_period;
		rs232in <= '0';
		wait for bit_period;
		rs232in <= '0';
		wait for bit_period;
		rs232in <= '0';
		wait for bit_period;
		rs232in <= '1';
		wait for bit_period;
		rs232in <= '1';
		wait for bit_period;
		rs232in <= '0';
		wait for bit_period;
		rs232in <= '0';
		wait for bit_period;
		rs232in <= '1';	-- Stop bit
		wait for bit_period;

		-- we should see the decoded byte.
		assert keydata = x"31" severity FAILURE;

		report "all OK" severity FAILURE;
   end process;

END;
