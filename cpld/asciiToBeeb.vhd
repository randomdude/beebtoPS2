library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity asciiToBeeb is
    Port ( ascii : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           beeb_row : out  STD_LOGIC_VECTOR (2 downto 0);
           beeb_col : out  STD_LOGIC_VECTOR (3 downto 0);
           beeb_keydown : out  STD_LOGIC);
end asciiToBeeb;

architecture Behavioral of asciiToBeeb is

begin

process(clk) 
begin
	if rising_edge(clk) then
		beeb_keydown <= ascii(7);
		
		case "0" & ascii(6 downto 0) is
			when x"30" => beeb_row <= "010"; beeb_col <= "0111";
			when x"31" => beeb_row <= "110"; beeb_col <= "0000";
			when x"32" => beeb_row <= "110"; beeb_col <= "0001";
			when x"33" => beeb_row <= "100"; beeb_col <= "0001";
			when x"34" => beeb_row <= "100"; beeb_col <= "0010";
			when x"35" => beeb_row <= "100"; beeb_col <= "0011";
			when x"36" => beeb_row <= "110"; beeb_col <= "0100";
			when x"37" => beeb_row <= "010"; beeb_col <= "0100";
			when x"38" => beeb_row <= "100"; beeb_col <= "0101";
			when x"39" => beeb_row <= "010"; beeb_col <= "0111";			
			when others => beeb_row <= "000"; beeb_col <= "0000";
		end case;
	end if;

end process;

end Behavioral;

