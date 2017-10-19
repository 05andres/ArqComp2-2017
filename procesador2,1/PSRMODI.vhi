
-- VHDL Instantiation Created from source file PSRMODI.vhd -- 21:50:02 10/16/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_PSRMODI: PSRMODI PORT MAP(
		crs1 => ,
		crs2mux => ,
		opuc => ,
		salalu => ,
		nzvc => ,
		rst => 
	);


