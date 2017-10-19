
-- VHDL Instantiation Created from source file PSR.vhd -- 21:56:49 10/16/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PSR
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		rst : IN std_logic;          
		c : OUT std_logic
		);
	END COMPONENT;

	Inst_PSR: PSR PORT MAP(
		nzvc => ,
		rst => ,
		c => 
	);


