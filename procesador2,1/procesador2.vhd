----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:52:26 10/03/2017 
-- Design Name: 
-- Module Name:    procesador2 - arq_procesador2 
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

entity procesador2 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador2;

architecture arq_procesador2 of procesador2 is
COMPONENT sumador
	PORT(
		op2 : IN std_logic_vector(31 downto 0);          
		result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT npc
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		senal : IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT UC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		saluc : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
COMPONENT registerfile
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;
		dwr : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT MUX
	PORT(
		I : IN std_logic;
		salseu : IN std_logic_vector(31 downto 0);
		salrs2 : IN std_logic_vector(31 downto 0);          
		salmux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT SEU
	PORT(
		imm : IN std_logic_vector(12 downto 0);          
		salseu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT PSRMODI
	PORT(
		crs1 : IN std_logic_vector(31 downto 0);
		crs2mux : IN std_logic_vector(31 downto 0);
		opuc : IN std_logic_vector(5 downto 0);
		salalu : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

COMPONENT PSR
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		rst : IN std_logic;          
		c : OUT std_logic
		);
END COMPONENT;


COMPONENT ALU
	PORT(
		saluc : IN std_logic_vector(5 downto 0);
		crs1 : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);
      carry: IN STD_LOGIC;		
		salalu : OUT std_logic_vector(31 downto 0)
		
		);
	END COMPONENT;



signal sumatonpc,salAlu,NpctoPc,PctoIm,ImtoURC,crs1toAlu,crs2tomux,seutomux,muxtoalu: STD_LOGIC_VECTOR (31 downto 0);
signal UctoAlu: STD_LOGIC_VECTOR (5 downto 0);
signal psrmtosr: STD_LOGIC_VECTOR (3 downto 0);
signal ctopsr:STD_LOGIC;
begin

      Inst_sumador: sumador PORT MAP(
		op2 =>PctoIm,
		result =>sumatonpc
	);


	   Inst_npc: npc PORT MAP(
		clk =>clk,
		rst =>rst,
		senal =>sumatonpc,
		salida =>NpctoPc
	);
	
		Inst_pc: npc PORT MAP(
		clk =>clk,
		rst =>rst,
		senal =>NpctoPc,
		salida =>PctoIm
	);
	
	Inst_instructionMemory: instructionMemory PORT MAP(
		address =>PctoIm ,
		reset =>rst,
		outInstruction =>ImtoURC
	);
	Inst_UC: UC PORT MAP(
		op => ImtoURC(31 downto 30),
		op3 => ImtoURC(24 downto 19),
		saluc => UctoAlu
	);
	 
	 	Inst_registerfile: registerfile PORT MAP(
		rs1 => ImtoURC(18 downto 14),
		rs2 => ImtoURC(4 downto 0),
		rd => ImtoURC(29 downto 25),
		rst => rst,
		dwr =>salAlu,
		crs1 =>crs1toAlu ,
		crs2 =>crs2tomux
	);

      
		Inst_MUX: MUX PORT MAP(
		I => ImtoURC(13),
		salseu =>seutomux,
		salrs2 =>crs2tomux,
		salmux =>muxtoalu
	);
	    
		
	   Inst_SEU: SEU PORT MAP(
		imm =>ImtoURC(12 downto 0), 
		salseu =>seutomux
	);
	   
		Inst_PSRMODI: PSRMODI PORT MAP(
		crs1 =>crs1toAlu ,
		crs2mux =>muxtoalu ,
		opuc =>UctoAlu,
		salalu =>salAlu ,
		nzvc =>psrmtosr,
		rst =>rst 
	);
	   Inst_PSR: PSR PORT MAP(
		nzvc =>psrmtosr,
		rst =>rst,
		c =>ctopsr 
	);

		
	   Inst_ALU: ALU PORT MAP(
		saluc => UctoAlu ,
		crs1 =>crs1toAlu,
		crs2 =>muxtoalu ,
		carry=>ctopsr,
		salalu =>salAlu
	); 	
	   salida<=salAlu;

end arq_procesador2;

