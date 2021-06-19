LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY mux IS
    PORT (
        s0, s1, e0, e1, e2, e3 : IN STD_LOGIC;
        sal0, sal1, sal2 : OUT STD_LOGIC
    );
END mux;
----
ARCHITECTURE arq_mux OF mux IS
    SIGNAL s : STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN

    s(1) <= s1;
    s(0) <= s0;

    sal0 <= e0 WHEN s = "00" ELSE
        e1 WHEN s = "10" ELSE
        e2 WHEN s = "01" ELSE
        e3 WHEN s = "11" ELSE
        'U';

    sal1 <= e3 WHEN s = "00" ELSE
        e2 WHEN s = "10" ELSE
        e1 WHEN s = "01" ELSE
        e0 WHEN s = "11" ELSE
        'U';

    sal2 <= e2 WHEN s = "00" ELSE
        e0 WHEN s = "10" ELSE
        e3 WHEN s = "01" ELSE
        e1 WHEN s = "11" ELSE
        'U';

END arq_mux;