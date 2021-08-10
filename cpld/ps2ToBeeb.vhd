library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ps2ToBeeb is
    Port ( ps2_clk : in  STD_LOGIC;
           ps2_data : in  STD_LOGIC;
           beeb_clk : in  STD_LOGIC;
           beeb_row : out  STD_LOGIC_VECTOR (2 downto 0);
           beeb_col : out  STD_LOGIC_VECTOR (3 downto 0);
           beeb_keydown : out  STD_LOGIC;
			  beeb_shiftState : out  STD_LOGIC;
			  beeb_ctrlState : out  STD_LOGIC;
			  dbgleds : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end ps2ToBeeb;

architecture Behavioral of ps2ToBeeb is
	signal bitCount: std_logic_vector(3 downto 0) := "0000";
	signal ps2Input: std_logic_vector(7 downto 0) := "00000000";
	signal recvTimeout: std_logic_vector(26 downto 0) := (others => '0');
	signal willReleaseNext: std_logic := '0';

	-- Store state of modifier keys
	signal shiftState:  std_logic := '0';
	signal controlState:  std_logic := '0';

	signal lastps2clk:  std_logic := '0';
	
	signal ps2Bit: std_logic := '0';
begin

process(ps2_clk, ps2_data)
begin
	--	Capture a bit on ps2_clk rising edge..
	if rising_edge(ps2_clk) then
		ps2Bit <= ps2_data;
	end if;
end process;
 
process(beeb_clk)
begin

	--dbgleds(0) <= recvTimeout(26);
	--dbgleds(0) <= 
	--dbgleds(3 downto 0) <= bitCount;

	if rising_edge(beeb_clk) then
		lastps2clk <= ps2_clk;

		-- count clocks since a transition occured on the ps/2 clock line
		if ps2_clk = lastps2clk then
			if recvTimeout(24) = '0' then
				recvTimeout <= std_logic_vector(to_unsigned(to_integer(unsigned(recvTimeout )) + 1, 25));
			end if;
		else
			recvTimeout <= (others => '0');
		end if;

		-- If we haven't seen any clock transitions for a long time, reset the bit counter to zero
		-- thus discarding any bits recieved so far
		if recvTimeout(24) = '1' then
			bitCount <= (others => '0');
		else
			-- We captured data on the rising edge of the ps2_clk. On the falling edge, we process it.
			if ps2_clk = '0' and lastps2clk = '1' then
				-- transfer the bit out of the ps2clk-domain register
				ps2Input <= ps2bit & ps2Input(7 downto 1);
				 
				-- Advance to the next bit
				if (bitCount = "0000") then 
					-- If this is the first bit, ensure it is a valid start bit (ie, low)
					if (ps2bit = '0') then
						bitCount <= std_logic_vector(to_unsigned(to_integer(unsigned(bitCount)) + 1, 4));
					end if;
				elsif (bitCount = "1001") then
					-- If we have received an entire transmission and the line is now idle, reset to zero
					bitCount <=  (others => '0');
				else 
					bitCount <= std_logic_vector(to_unsigned(to_integer(unsigned(bitCount)) + 1, 4));
				end if;
		
				-- If we have ten bits (start bit, eight data bits, parity, and the stop bit) then we should decode the keystroke.
				if (bitCount = "1001") then
					--dbgleds(1) <= controlState;
					--dbgleds(3 downto 0) <= ps2Input(7 downto 4);

					--bitCount <= 0;
					
					if ps2Input(7 downto 0) = x"f0" then
						willReleaseNext <= '1';
					else
						willReleaseNext <= '0';
						if willReleaseNext = '1' then
							-- handle key-release for modifier keys specially.
							if ps2Input(7 downto 0) = x"12" or 
								ps2Input(7 downto 0) = x"59" then
								-- left or right shift is being released.
								-- This will cause problems if the user is holding down both shift keys, as we will release the beeb shift key
								-- as soon as the first PS/2 shift key is released.
								shiftState <= '0';
							elsif ps2Input(7 downto 0) = x"14" then
								-- ctrl is being released.
								controlState <= '0';
							else
								-- Just release whatever key we have held down right now.
								beeb_keydown <= '0';
							end if;
						else
							beeb_keydown <= '1';
						
							case ps2Input(7 downto 0) is
								-- modifier keys
								when x"12" => shiftState <= '1'; 	-- Shift (left)
								when x"59" => shiftState <= '1'; 	-- Shift (right)
								when x"14" => controlState <= '1';	-- ctrl (left)

									-- Digits 0 to 9
									when x"45" => beeb_row <= "010"; beeb_col <= "0111";
									when x"16" => beeb_row <= "110"; beeb_col <= "0000";
									when x"1e" => beeb_row <= "110"; beeb_col <= "0001";
									when x"26" => beeb_row <= "100"; beeb_col <= "0001";
									when x"25" => beeb_row <= "100"; beeb_col <= "0010";
									when x"2e" => beeb_row <= "100"; beeb_col <= "0011";
									when x"36" => beeb_row <= "110"; beeb_col <= "0100";
									when x"3d" => beeb_row <= "010"; beeb_col <= "0100";
									when x"3e" => beeb_row <= "100"; beeb_col <= "0101";
									when x"46" => beeb_row <= "010"; beeb_col <= "0111";
									-- Letters A-E
									when x"1C" => beeb_row <= "100"; beeb_col <= "0010";
									when x"32" => beeb_row <= "110"; beeb_col <= "0100";
									when x"21" => beeb_row <= "101"; beeb_col <= "0010";
									when x"23" => beeb_row <= "011"; beeb_col <= "0010";
									when x"24" => beeb_row <= "010"; beeb_col <= "0010";
									-- F-J
									when x"2b" => beeb_row <= "100"; beeb_col <= "0011";
									when x"34" => beeb_row <= "101"; beeb_col <= "0011";
									when x"33" => beeb_row <= "101"; beeb_col <= "0100";
									when x"43" => beeb_row <= "010"; beeb_col <= "0101";
									when x"3b" => beeb_row <= "100"; beeb_col <= "0101";
									-- K-O
									when x"42" => beeb_row <= "100"; beeb_col <= "0110";
									when x"4b" => beeb_row <= "101"; beeb_col <= "0110";
									when x"3a" => beeb_row <= "100"; beeb_col <= "0100";
									when x"31" => beeb_row <= "101"; beeb_col <= "0101";
									when x"44" => beeb_row <= "011"; beeb_col <= "0110";
									-- P-T
									when x"4d" => beeb_row <= "011"; beeb_col <= "0111";
									when x"15" => beeb_row <= "001"; beeb_col <= "0000";
									when x"2d" => beeb_row <= "011"; beeb_col <= "0011";
									when x"1b" => beeb_row <= "101"; beeb_col <= "0001";
									when x"2c" => beeb_row <= "010"; beeb_col <= "0011";
									-- U -Y
									when x"3c" => beeb_row <= "011"; beeb_col <= "0101";
									when x"2a" => beeb_row <= "110"; beeb_col <= "0011";
									when x"1d" => beeb_row <= "010"; beeb_col <= "0001";
									when x"22" => beeb_row <= "100"; beeb_col <= "0010";
								when x"35" => beeb_row <= "100"; beeb_col <= "0100";
								-- Z
								when x"1a" => beeb_row <= "110"; beeb_col <= "0001";
									
								-- Special characters
								when x"0D" => beeb_row <= "110"; beeb_col <= "0000";	-- Tab
								when x"29" => beeb_row <= "110"; beeb_col <= "0010";	-- Space
								when x"76" => beeb_row <= "111"; beeb_col <= "0000";	-- Escape
								when x"58" => beeb_row <= "100"; beeb_col <= "0000";	-- Caps lock
								when x"5A" => beeb_row <= "100"; beeb_col <= "1001";	-- Enter
									
								-- <>?;@ : ^\
								when x"66" => beeb_row <= "000"; beeb_col <= "0001";	-- Backspace (should this be mapped to DELETE instead?)
								--when x"e0 70" => beeb_row <= "000"; beeb_col <= "0001";	-- Insert (mapped to COPY)
								when x"54" => beeb_row <= "011"; beeb_col <= "1000";	-- [
								when x"5B" => beeb_row <= "101"; beeb_col <= "1000";	-- ]
								when x"4C" => beeb_row <= "101"; beeb_col <= "0111";	-- ;
									
									-- Function keys
								when x"05" => beeb_row <= "111"; beeb_col <= "0001";	-- F1
								when x"06" => beeb_row <= "111"; beeb_col <= "0010";	-- F2
								when x"04" => beeb_row <= "111"; beeb_col <= "0011";	-- F3
								when x"0c" => beeb_row <= "001"; beeb_col <= "0100";	-- F4
								when x"03" => beeb_row <= "111"; beeb_col <= "0100";	-- F5
								when x"0b" => beeb_row <= "111"; beeb_col <= "0101";	-- F6
								when x"83" => beeb_row <= "001"; beeb_col <= "0110";	-- F7
								when x"0a" => beeb_row <= "111"; beeb_col <= "0110";	-- F8
								when x"01" => beeb_row <= "111"; beeb_col <= "0111";	-- F9
								when x"09" => beeb_row <= "010"; beeb_col <= "0000";	-- F10 (mapped to f0)
								
								when others => beeb_row <= "000"; beeb_col <= "0000";
							end case;
						end if;
					end if;
				end if;
			end if;
		end if;
		
	end if;

end process;

end Behavioral;

