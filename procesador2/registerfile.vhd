----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:48 09/30/2017 
-- Design Name: 
-- Module Name:    registerfile - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registerfile is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  rst : in  STD_LOGIC;
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end registerfile;

architecture Behavioral of registerfile is
type ram is array(0 to 31) of std_logic_vector(31 downto 0);
signal registers: ram := (X"00000000", X"00000006", X"00000007", X"0000000A", X"00000025", X"00000002",
                             X"00000015", X"0000000F", X"00000A05", X"0000000C", X"0000000D", X"A010000F",
                             X"00000005", X"00000006", X"00000007", X"0000000A", X"00000025", X"00000002",
                             X"00000015", X"0000000F", X"00000A05", X"0000000C", X"0000000D", X"A010000F",
                             X"00000005",X"00000006", X"00000007", X"0000000A", X"00000025", X"00000002",
                             X"00000015", X"0000000F"); 

begin
process(rs1,rs2,rst,rd,dwr,registers)
begin
   if(rst = '1')then
				crs1 <= (others=>'0');
				crs2 <= (others=>'0');

	else
	   crs1<= registers(conv_integer(rs1));
		crs2<= registers(conv_integer(rs2));
	    if(rd /="00000")then
	        registers(conv_integer(rd))<=dwr;
		 end if;
		   	
   end if;
end process;

end Behavioral;

