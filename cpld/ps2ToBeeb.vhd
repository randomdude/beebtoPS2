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
			  beeb_breakState : out  STD_LOGIC;
			  dbgleds : out  STD_LOGIC_VECTOR (9 downto 0)
			  );
end ps2ToBeeb;

architecture Behavioral of ps2ToBeeb is
	signal bitCount: std_logic_vector(3 downto 0) := "0000";
	signal ps2Input: std_logic_vector(7 downto 0) := "00000000";
	signal recvTimeout: integer := 0;
--	signal recvTimeout: std_logic_vector(8 downto 0) := (others => '0');
	signal willReleaseNext: std_logic := '0';
	signal prevWasE0: std_logic := '0';

	-- Store state of modifier keys
	signal keydown:  std_logic := '0';
	signal shiftState_l:  std_logic := '0';
	signal shiftState_r:  std_logic := '0';
	signal ctrlState:  std_logic := '0';
	signal breakState:  std_logic := '0';

	signal lastps2clk:  std_logic := '0';
	signal lastps2clkA:  std_logic := '0';
	
	signal ps2BitA: std_logic := '1';
	signal ps2Bit: std_logic := '1';
	
	signal delay: std_logic := '0';
begin

process(ps2_clk, ps2_data)
begin
	--	Capture a bit on ps2_clk rising edge..
	if rising_edge(ps2_clk) then
		ps2BitA <= ps2_data;
	end if;
end process;
 
process(beeb_clk, recvTimeout, lastps2clk, ps2_clk, keydown, shiftState_l, shiftState_r, ctrlState, breakState, willReleaseNext, prevWasE0)
begin

	if recvTimeout = 1024 then
		dbgleds(0) <= '1';
	else
		dbgleds(0) <= '0';
	end if;

	if rising_edge(beeb_clk) then
		--beeb_beeb_row <= beeb_row;
		beeb_keydown <= keydown;
		beeb_shiftState <= shiftState_l or shiftState_r;
		beeb_ctrlState <= ctrlState;
		beeb_breakState <= breakState;

		ps2Bit  <= ps2BitA;
		lastps2clkA <= ps2_clk;
		lastps2clk <= lastps2clkA;

		-- count clocks since a transition occured on the ps/2 clock line
		if lastps2clkA = lastps2clk then
			if recvTimeout /= 1024 then
				recvTimeout <= recvTimeout + 1;
			end if;
		else
			recvTimeout <= 0;
		end if;

		-- If we haven't seen any clock transitions for a long time, reset the bit counter to zero
		-- thus discarding any bits recieved so far
		if recvTimeout = 1024 then
			bitCount <= (others => '0');
		end if;

		-- We captured data on the rising edge of the ps2_clk. A beebclk later, we process it.
		if lastps2clkA = '1' and lastps2clk = '0' then
			delay <= '1';
		end if;
		
		if delay = '1' then
			delay <= '0';

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
				
				if ps2Input(7 downto 0) = x"F0" then
					-- This is 0xF0, so the next byte will determine which key has been released.
					willReleaseNext <= '1';
				else
					willReleaseNext <= '0';
				end if;

				if ps2Input(7 downto 0) = x"E0" then
					-- this is 0xE0, so the next byte will determine which key is pressed.
					prevWasE0 <= '1';
				else
					prevWasE0 <= '0';
				end if;
				
				-- If this is not a modifier key, set the keydown output indicating that a key is pressed.
				-- fixme: these should be checked only if prevWasE) is 0
				if ps2Input = x"12" or ps2Input = x"59" or ps2Input = x"14" or ps2Input = x"7E" then
					-- ... cpldfit keeps AV'ing, hence the weird syntax here ...
				else
					keydown <= '1';
				end if;
				
				case '0' & '0' & prevWasE0 & willReleaseNext & ps2Input(7 downto 0) is
					-- Careful here.
					-- The three-bit 'row' is active low, but the four-bit 'col' is not.

					when x"0f0" =>
					when x"0e0" =>
					when x"1f0" =>
					when x"1e0" =>

					-- handle key-release for modifier keys specially.
					when x"112" => shiftState_l 	<= '0'; 	-- Shift (left)
					when x"159" => shiftState_r 	<= '0'; 	-- Shift (right)
					when x"114" => ctrlState		<= '0';	-- ctrl (left)
					when x"17E" => breakState  	<= '0';	-- scroll lock

					-- Special keys
					when x"270" => beeb_row <= "000"; beeb_col <= "1001";	-- Insert (mapped to COPY)
					when x"26B" => beeb_row <= "001"; beeb_col <= "1001";	-- cursor left
					when x"272" => beeb_row <= "010"; beeb_col <= "1001";	-- cursor down
					when x"274" => beeb_row <= "111"; beeb_col <= "1001";	-- cursor right
					when x"275" => beeb_row <= "011"; beeb_col <= "1001";	-- cursor up

					-- modifier keys
					when x"012" => shiftState_l <= '1'; 	-- Shift (left)
					when x"059" => shiftState_r <= '1'; 	-- Shift (right)
					when x"014" => ctrlState  <= '1';		-- ctrl (left)
					when x"07E" => breakState <= '1';		-- scroll lock (should probably be PAUSE/BREAK instead)

					-- Digits 0 to 9
					when x"045" => beeb_row <= "010"; beeb_col <= "0111";
					when x"016" => beeb_row <= "011"; beeb_col <= "0000";
					when x"01e" => beeb_row <= "011"; beeb_col <= "0001";
					when x"026" => beeb_row <= "001"; beeb_col <= "0001";
					when x"025" => beeb_row <= "001"; beeb_col <= "0010";
					when x"02e" => beeb_row <= "001"; beeb_col <= "0011";
					when x"036" => beeb_row <= "011"; beeb_col <= "0100";
					when x"03d" => beeb_row <= "010"; beeb_col <= "0100";
					-- For the digit '8', send an asterisk if the SHIFT key is down.
					when x"03e" => 
						if shiftState_r = '0' and shiftState_l = '0' then
								beeb_row <= "001"; beeb_col <= "0101";
						else
								beeb_row <= "100"; beeb_col <= "1000";
						end if;
					when x"046" => beeb_row <= "010"; beeb_col <= "0110";
					-- Letters A-E
					when x"01C" => beeb_row <= "100"; beeb_col <= "0001";
					when x"032" => beeb_row <= "110"; beeb_col <= "0100";
					when x"021" => beeb_row <= "101"; beeb_col <= "0010";
					when x"023" => beeb_row <= "011"; beeb_col <= "0010";
					when x"024" => beeb_row <= "010"; beeb_col <= "0010";
					-- F-J
					when x"02b" => beeb_row <= "100"; beeb_col <= "0011";
					when x"034" => beeb_row <= "101"; beeb_col <= "0011";
					when x"033" => beeb_row <= "101"; beeb_col <= "0100";
					when x"043" => beeb_row <= "010"; beeb_col <= "0101";
					when x"03b" => beeb_row <= "100"; beeb_col <= "0101";
					-- K-O
					when x"042" => beeb_row <= "100"; beeb_col <= "0110";
					when x"04b" => beeb_row <= "101"; beeb_col <= "0110";
					when x"03a" => beeb_row <= "110"; beeb_col <= "0101";
					when x"031" => beeb_row <= "101"; beeb_col <= "0101";
					when x"044" => beeb_row <= "011"; beeb_col <= "0110";
					-- P-T
					when x"04d" => beeb_row <= "011"; beeb_col <= "0111";
					when x"015" => beeb_row <= "001"; beeb_col <= "0000";
					when x"02d" => beeb_row <= "011"; beeb_col <= "0011";
					when x"01b" => beeb_row <= "101"; beeb_col <= "0001";
					when x"02c" => beeb_row <= "010"; beeb_col <= "0011";
					-- U -Y
					when x"03c" => beeb_row <= "011"; beeb_col <= "0101";
					when x"02a" => beeb_row <= "110"; beeb_col <= "0011";
					when x"01d" => beeb_row <= "010"; beeb_col <= "0001";
					when x"022" => beeb_row <= "100"; beeb_col <= "0010";
					when x"035" => beeb_row <= "100"; beeb_col <= "0100";
					-- Z
					when x"01a" => beeb_row <= "110"; beeb_col <= "0001";
						
					-- Special characters
					when x"00D" => beeb_row <= "110"; beeb_col <= "0000";	-- Tab
					when x"029" => beeb_row <= "110"; beeb_col <= "0010";	-- Space
					when x"076" => beeb_row <= "111"; beeb_col <= "0000";	-- Escape
					when x"058" => beeb_row <= "100"; beeb_col <= "0000";	-- Caps lock
					when x"05A" => beeb_row <= "100"; beeb_col <= "1001";	-- Enter
						
					-- Symbols and punctuation
					-- TODO: @ & ~ £ - ^
					when x"066" => beeb_row <= "101"; beeb_col <= "1001";	-- Backspace
					when x"054" => beeb_row <= "011"; beeb_col <= "1000";	-- [ }
					when x"05B" => beeb_row <= "101"; beeb_col <= "1000";	-- ] }
					when x"04C" => beeb_row <= "010"; beeb_col <= "1000";	-- ; +
					when x"049" => beeb_row <= "110"; beeb_col <= "0111";	-- .
					when x"041" => beeb_row <= "110"; beeb_col <= "0110";	-- ,
					when x"04A" => beeb_row <= "110"; beeb_col <= "1000";	-- / ?
					when x"05D" => beeb_row <= "000"; beeb_col <= "1000";	-- \ |
					
					-- Function keys
					when x"005" => beeb_row <= "000"; beeb_col <= "0001";	-- F1
					when x"006" => beeb_row <= "000"; beeb_col <= "0010";	-- F2
					when x"004" => beeb_row <= "000"; beeb_col <= "0011";	-- F3
					when x"00c" => beeb_row <= "110"; beeb_col <= "0100";	-- F4
					when x"003" => beeb_row <= "000"; beeb_col <= "0100";	-- F5
					when x"00b" => beeb_row <= "000"; beeb_col <= "0101";	-- F6
					when x"083" => beeb_row <= "110"; beeb_col <= "0110";	-- F7
					when x"00a" => beeb_row <= "000"; beeb_col <= "0110";	-- F8
					when x"001" => beeb_row <= "000"; beeb_col <= "0111";	-- F9
					when x"009" => beeb_row <= "101"; beeb_col <= "0000";	-- F10 (mapped to f0)
					
					when others => 
						if willReleaseNext = '1' then
							-- Just release whatever key we have held down right now.
							keydown <= '0';
						end if;
						beeb_row <= "000"; beeb_col <= "0000";
				end case;
			end if;
		end if;
		
	end if;

end process;

end Behavioral;

