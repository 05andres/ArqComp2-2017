----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:38:19 10/12/2017 
-- Design Name: 
-- Module Name:    PSRMODI - Behavioral 
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

entity PSRMODI is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2mux : in  STD_LOGIC_VECTOR (31 downto 0);
           opuc : in  STD_LOGIC_VECTOR (5 downto 0);
           salalu : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0);
           rst : in  STD_LOGIC);
end PSRMODI;

architecture Behavioral of PSRMODI is

begin
process(crs1,crs2mux,opuc,salalu,rst)
begin
if(rst='1')then
   nzvc <= "0000";
else
   if(opuc="001010" or opuc="001011")then
      nzvc(3)<=salalu(31);
      if(salalu=x"00000000")then
       nzvc(2)<='1';
     else
       nzvc(2)<='0';
	  end if;
     nzvc(1)<=(crs1(31) and crs2mux(31) and (not salalu(31))) or((not crs1(31)) and (not crs2mux(31)) and salalu(31));
     nzvc(0)<=(crs1(31) and crs2mux(31)) or (not(salalu(31)) and (crs1(31) or crs2mux(31)));
    end if;
	if(opuc="001000" or opuc="001001")then
      nzvc(3)<=salalu(31);
      if(salalu=x"00000000")then
       nzvc(2)<='1';
     else
       nzvc(2)<='0';
	  end if;
     nzvc(1)<=(crs1(31) and (not crs2mux(31)) and (not salalu(31))) or((not crs1(31)) and crs2mux(31) and salalu(31));
     nzvc(0)<=((not crs1(31)) and crs2mux(31)) or(salalu(31) and ((not crs1(31)) or crs2mux(31))); 
    end if;
  -- ANDcc, ANDNcc, ORcc, ORNcc, XORcc, XNORcc
   if ((opuc="001100") or (opuc="001101") or (opuc="001110")
		 or(opuc="010001") or (opuc="001111") or (opuc="010000")) then
		nzvc(3) <= salalu(31);
		  if (salalu = "00000000000000000000000000000000") then
				nzvc(2) <= '1';
		  else
				nzvc(2) <= '0';
		  end if;
			nzvc(1) <= '0';
			nzvc(0) <= '0';
	end if;		   
end if;
end process; 
  
   


end Behavioral;

