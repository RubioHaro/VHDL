LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY booth_multiplier IS

	PORT(m : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	     r : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	     result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
		  
END booth_multiplier;

ARCHITECTURE behavior OF booth_multiplier IS

BEGIN
	
	PROCESS(m, r)
		
		CONSTANT X_ZEROS : STD_LOGIC_VECTOR(4 DOWNTO 0) := (OTHERS => '0');
		CONSTANT Y_ZEROS : STD_LOGIC_VECTOR(4 DOWNTO 0) := (OTHERS => '0');
		
		VARIABLE a, s, p : STD_LOGIC_VECTOR(10 + 1 DOWNTO 0);
		VARIABLE mn      : STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	BEGIN
		
		a := (OTHERS => '0');
		s := (OTHERS => '0');
		p := (OTHERS => '0');
		
		IF (m /= X_ZEROS AND r /= Y_ZEROS) THEN
			
			a(10 DOWNTO 6) := m;
			a(10 + 1) := m(4);
			
			mn := (NOT m) + 1; -- Modulo 2
			
			s(10 DOWNTO 6) := mn;
			s(10 + 1) := NOT(m(4));
			
			p(5 DOWNTO 1) := r;
            
			FOR i IN 1 TO 5 LOOP
				
				IF (p(1 DOWNTO 0) = "01") THEN
					p := p + a;
				ELSIF (p(1 DOWNTO 0) = "10") THEN
					p := p + s;
				END IF;
				
				-- Shift Right Arithmetic
				p(10 DOWNTO 0) := p(10 + 1 DOWNTO 1);
			
			END LOOP;
			
		END IF;
		
		result <= p(8 DOWNTO 1);
		
	END PROCESS;
	
END behavior;