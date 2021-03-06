--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:50:09 10/02/2017
-- Design Name:   
-- Module Name:   D:/arquivdhl/procesador1/tb_npc.vhd
-- Project Name:  procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: npc
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
 
ENTITY tb_npc IS
END tb_npc;
 
ARCHITECTURE behavior OF tb_npc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT npc
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         senal : IN  std_logic_vector(31 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal senal : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: npc PORT MAP (
          clk => clk,
          rst => rst,
          senal => senal,
          salida => salida
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	

        RST<='1';
		  SENAL<=x"0000000A";
		  wait for 20ns;
        RST<='0';
		  SENAL<=x"0000000A";
		  wait for 20ns;	
		  SENAL<=x"0000002A";
		  wait for 20ns;
		  SENAL<=x"0000000B";
         wait;
   end process;

END;
