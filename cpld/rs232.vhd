library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rs232 is
	port(
			  clk50mhz : in  STD_LOGIC;
			  rs232in: in STD_LOGIC;
			  keydata: out  STD_LOGIC_VECTOR(7 downto 0)
	);
end rs232;

architecture Behavioral of rs232 is
	signal bauddelay: integer := 0;
	signal bitCount: std_logic_vector(10 downto 0) := "10000000000";
begin

process(clk50mhz)
begin
	if rising_edge(clk50mhz) then
		if (bauddelay = 0) then
			-- idle state. Wait for start bit
			if (rs232in = '0') then
				bauddelay <= 5201 / 2;
				-- clear bit 10 (to indicate non-idle) set and bit zero (to indicate we're on the start bit).
				bitCount <= "00000000001";
			end if;
		else
			bauddelay <= bauddelay + 1;
		
			if (bauddelay = 5201) then
				-- Move to the next bit by shifting the one-hot bit index
				bitCount(9 downto 1) <= bitCount(8 downto 0);
				bitCount(0) <= '0';
				
				if bitCount(9) = '1' then
					-- whole byte is recieved. Go idle.
					bitCount <= "10000000000";
					bauddelay <= 0;
				else
					-- capture this bit
					if bitcount(1) = '1' then
						keydata(0) <= rs232in;
					end if;
					if bitcount(2) = '1' then
						keydata(1) <= rs232in;
					end if;
					if bitcount(3) = '1' then
						keydata(2) <= rs232in;
					end if;
					if bitcount(4) = '1' then
						keydata(3) <= rs232in;
					end if;
					if bitcount(5) = '1' then
						keydata(4) <= rs232in;
					end if;
					if bitcount(6) = '1' then
						keydata(5) <= rs232in;
					end if;
					if bitcount(7) = '1' then
						keydata(6) <= rs232in;
					end if;
					if bitcount(8) = '1' then
						keydata(7) <= rs232in;
					end if;
				
					-- restart at next bit.
					bauddelay <= 1;
				end if;

			end if;
		end if;
	end if;

end process;

end Behavioral;

