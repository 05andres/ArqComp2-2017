----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:56 09/30/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( saluc : in  STD_LOGIC_VECTOR (5 downto 0);
           crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           salalu : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
process(saluc,crs1,crs2)
begin
   case saluc is
	    when "000000" =>salalu<= crs1 + crs2;--add
		 when "000001" =>salalu<= crs1 - crs2;--sub
		 when "000010" =>salalu<= crs1 and crs2;--and
		 when "000011" =>salalu<= crs1 and not crs2;--andn
		 when "000100" =>salalu<= crs1 or crs2;--or
		 when "000101" =>salalu<= crs1 or not crs2;--orn
		 when "000110" =>salalu<= crs1 xor crs2;--xor
		 when "000111" =>salalu<= crs1 xnor crs2;--xnor	 
		 when others => salalu <= x"00000000";
	end case;
end process;
	       

end Behavioral;

