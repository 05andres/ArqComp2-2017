----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:29 09/30/2017 
-- Design Name: 
-- Module Name:    UC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           saluc : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture Behavioral of UC is

begin
process(op,op3)
begin
   if(op="10")then
	   case op3 is 
		    when "000000" => saluc <="000000";--add
			 when "000100" => saluc <="000001";--sub
			 when "000001" => saluc <="000010";--and
			 when "000101" => saluc <="000011";--andn
			 when "000010" => saluc <="000100";--or
			 when "000110" => saluc <="000101";--orn
			 when "000011" => saluc <="000110";--xor
			 when "000111" => saluc <="000111";--xnor
			 when others => saluc <= "111111";
      end case;
	end if;
end process;

end Behavioral;

