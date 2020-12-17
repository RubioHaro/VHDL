-- RRRH
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
----------------------------------------
ENTITY flipflopJK IS
    PORT (
        clk, reset, j, k : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC
    );
END flipflopJK;
----
ARCHITECTURE arq_jk OF flipflopJK IS
BEGIN
    PROCESS (clk, reset, j, k)
        VARIABLE Qn : STD_LOGIC := '0';
    BEGIN
        IF (reset = '1') THEN
            Qn := '0';
        ELSIF (clk'event AND clk = '1') THEN

            IF (j /= k) THEN
                Qn := j;
            ELSIF (j = '1' AND k = '1') THEN
                Qn := NOT Qn; -- hacemos el Toogle 
            END IF;
        END IF;
        q <= Qn;
        nq <= NOT Qn;
    END PROCESS;
END arq_jk;