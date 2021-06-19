LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY mux IS
    PORT (
        s : IN STD_LOGIC;
        a, b : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- 3 Bits
        res : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) -- 3 Bits
    );
END mux;
----
ARCHITECTURE arq_mux OF mux IS
BEGIN

    PROCESS (a, b, s)
    BEGIN

        --Secuencial
        CASE (s) IS
            WHEN '0' =>
                res(2 DOWNTO 0) <= a;
            WHEN '1' =>
                res(2 DOWNTO 0) <= b;

            WHEN OTHERS =>
                res <= "UUU";

        END CASE;
    END PROCESS;

END arq_mux;