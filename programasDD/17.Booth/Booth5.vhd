LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY booth_multiplier IS

	PORT (
		multndo : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		multdor : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		salida : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));

END booth_multiplier;

ARCHITECTURE behavior OF booth_multiplier IS

BEGIN

	PROCESS (multndo, multdor)
		VARIABLE a, s, p : STD_LOGIC_VECTOR(10 + 1 DOWNTO 0);
		--VARIABLE modulo : STD_LOGIC_VECTOR(4 DOWNTO 0);

	BEGIN

		a := (OTHERS => '0');
		s := (OTHERS => '0');
		p := (OTHERS => '0');

		a(10 DOWNTO 6) := multndo;
		a(10 + 1) := multndo(4);

		--modulo := (NOT multndo) + 1; -- Modulo 2

		s(10 DOWNTO 6) := (NOT multndo) + 1;
		s(10 + 1) := NOT(multndo(4));

		p(5 DOWNTO 1) := multdor;
		

		FOR i IN 1 TO 5 LOOP

			IF (p(1 DOWNTO 0) = "01") THEN
				p := p + a;
			ELSIF (p(1 DOWNTO 0) = "10") THEN
				p := p + s;
			END IF;

			-- Shift Right Arithmetic
			p(10 DOWNTO 0) := p(10 + 1 DOWNTO 1);

		END LOOP;
		salida <= p(8 DOWNTO 1);

	END PROCESS;

END behavior;