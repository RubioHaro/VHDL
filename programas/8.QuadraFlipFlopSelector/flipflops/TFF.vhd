-- RRRH
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
----------------------------------------
ENTITY flipflopT IS
    PORT (
        clk, reset, t : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC
    );
END flipflopT;
----
ARCHITECTURE arq_t OF flipflopT IS
BEGIN
    PROCESS (clk, reset)
        VARIABLE temp : STD_LOGIC;
    BEGIN
        IF (reset = '1') THEN
            temp := '0';
        ELSIF (clk'event AND clk = '1') THEN
            temp := t XOR temp;
        END IF;
        q <= temp;
        nq <= NOT temp;
    END PROCESS;
END arq_t;