LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY multiplicador_booth IS
	PORT (
		multndo : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		multdor : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		salida : OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
END multiplicador_booth;

ARCHITECTURE behavior OF multiplicador_booth IS
BEGIN
	PROCESS (multndo, multdor)
		VARIABLE a, s, p : STD_LOGIC_VECTOR(6 + 1 DOWNTO 0);

	BEGIN
		a := (OTHERS => '0');
		s := (OTHERS => '0');
		p := (OTHERS => '0');

		a(6 DOWNTO 4) := multndo;
		a(6 + 1) := multndo(2);
		s(6 DOWNTO 4) := (NOT multndo) + 1; -- Modulo 2
		s(6 + 1) := NOT(multndo(2));
		p(3 DOWNTO 1) := multdor;
		FOR i IN 1 TO 3 LOOP

			IF (p(1 DOWNTO 0) = "01") THEN
				p := p + a;
			ELSIF (p(1 DOWNTO 0) = "10") THEN
				p := p + s;
			END IF;

			-- corrimiento
			p(6 DOWNTO 0) := p(6 + 1 DOWNTO 1);

		END LOOP;
		salida <= p(6 DOWNTO 1);

	END PROCESS;

END behavior;