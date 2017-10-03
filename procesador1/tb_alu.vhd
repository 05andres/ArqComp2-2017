--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:06:40 09/30/2017
-- Design Name:   
-- Module Name:   D:/arquivdhl/procesador1/tb_alu.vhd
-- Project Name:  procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_alu IS
END tb_alu;
 
ARCHITECTURE behavior OF tb_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         saluc : IN  std_logic_vector(5 downto 0);
         crs1 : IN  std_logic_vector(31 downto 0);
         crs2 : IN  std_logic_vector(31 downto 0);
         salalu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal saluc : std_logic_vector(5 downto 0) := (others => '0');
   signal crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salalu : std_logic_vector(31 downto 0);
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          saluc => saluc,
          crs1 => crs1,
          crs2 => crs2,
          salalu => salalu
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
   
		saluc<="000000";
		crs1<=x"0000000F";
		crs2<=x"0000000F";
		wait for 100 ns;	
		saluc<="000001";
		crs1<=x"0000002F";
		crs2<=x"0000000F";
		wait for 100 ns;	
		saluc<="000110";
		crs1<=x"0000000A";
		crs2<=x"0000000B";

      wait;
   end process;

END;
