-- RRRH
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
----------------------------------------
ENTITY flipflopD IS
    PORT (
        clk, reset, d : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC
    );
END flipflopD;
----
ARCHITECTURE arq_d OF flipflopD IS
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF (reset = '1') THEN
            q <= '0';
        ELSIF (clk'event AND clk = '1') THEN
            q <= d;
        END IF;
        nq <= NOT q;
    END PROCESS;
END arq_d;