`timescale 1ns / 1ps
entity kb is

    input rs232,
    input clk50mhz
    output [7:0] keystroke,
    );


endmodule

process(clk50mhz, byteIn)
begin
	if rising_edge(clk50mhz) then
		dbgleds <= byteIn(3 downto 0);
		if (bauddelay = 0) then
			-- idle state. Wait for start bit
			if (rs232in = '0') then
				bauddelay <= 521 / 2;
				-- clear bit 10 (to indicate non-idle) set and bit zero (to indicate we're on the start bit).
				bitCount <= "00000000001";
			end if;
		else
			bauddelay <= bauddelay + 1;
		
			if (bauddelay = 521) then
				bitCount(9 downto 1) <= bitCount(8 downto 0);
				bitCount(0) <= '0';
				
				if bitCount(9) = '1' then
					-- whole byte is recieved. Go idle.
					bitCount <= "10000000000";
					bauddelay <= 0;
				else
					-- capture this bit
					if bitcount(1) = '1' then
						byteIn(0) <= rs232in;
					end if;
					if bitcount(2) = '1' then
						byteIn(1) <= rs232in;
					end if;
					if bitcount(3) = '1' then
						byteIn(2) <= rs232in;
					end if;
					if bitcount(4) = '1' then
						byteIn(3) <= rs232in;
					end if;
					if bitcount(5) = '1' then
						byteIn(4) <= rs232in;
					end if;
					if bitcount(6) = '1' then
						byteIn(5) <= rs232in;
					end if;
					if bitcount(7) = '1' then
						byteIn(6) <= rs232in;
					end if;
					if bitcount(8) = '1' then
						byteIn(7) <= rs232in;
					end if;
				
					-- restart at next bit.
					bauddelay <= 1;
				end if;

			end if;
		end if;
		
		case byteIn is
			when x"30" => byteInBeeb <= "1010111";
			when x"31" => byteInBeeb <= "1000000";
			when x"32" => byteInBeeb <= "1000001";
			when x"33" => byteInBeeb <= "1100001";
			when x"34" => byteInBeeb <= "1100010";
			when x"35" => byteInBeeb <= "1100011";
			when x"36" => byteInBeeb <= "1000100";
			when x"37" => byteInBeeb <= "1010100";
			when x"38" => byteInBeeb <= "1100101";
			when x"39" => byteInBeeb <= "1010101";
			when others => byteInBeeb <= "0000000";
		end case;
	end if;

end process;