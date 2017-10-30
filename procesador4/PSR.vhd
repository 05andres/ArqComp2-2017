----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:13:25 10/12/2017 
-- Design Name: 
-- Module Name:    PSR - Behavioral 
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

entity PSR is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           rst : in  STD_LOGIC;
			  ncwp: in STD_LOGIC_VECTOR (1 downto 0);
			  cwp: out STD_LOGIC_VECTOR (1 downto 0);
           c : out  STD_LOGIC);
			  end PSR;

architecture Behavioral of PSR is

begin
process(rst,nzvc,ncwp)
begin
   if(rst='1')then
		c<='0';
		cwp<="00";
	else
	   c<=nzvc(0);
		cwp<=ncwp;
	end if;
end process;
	

end Behavioral;

