-- RRRH
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
----------------------------------------
ENTITY flipflopSR IS
    PORT (
        clk, reset, s, r : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC
    );
END flipflopSR;
----
ARCHITECTURE arq_sr OF flipflopSR IS
BEGIN
    PROCESS (clk, reset, s, r)
        VARIABLE tmp : STD_LOGIC;
    BEGIN
        IF (reset = '1') THEN
            tmp := '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (s = '0' AND r = '0') THEN
                tmp := tmp;
            ELSIF (s = '0' AND r = '1') THEN
                tmp := '0';
            ELSE
                tmp := '1';
            END IF;
        END IF;
        q <= tmp;
        nq <= NOT tmp;
    END PROCESS;
END arq_sr;