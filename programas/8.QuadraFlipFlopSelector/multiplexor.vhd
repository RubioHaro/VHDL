LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY mux IS
    PORT (
        s0, s1, c0, c1, c2, c3 : IN STD_LOGIC;
        q : OUT STD_LOGIC
    );
END mux;
----
ARCHITECTURE arq_mux OF mux IS
	signal s : std_logic_vector (1 downto 0);

BEGIN

	s(1) <= s1;
    s(0) <= s0;

	  q <= c0 when s = "00" else
        c1 when s = "10" else
        c2 when s = "01" else
        c3 when s = "11" else
        'U';
END arq_mux;