LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
----------------------------------------
ENTITY flipflopJK IS
    PORT (
        clk, j, k : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC
    );
END flipflopJK;
----
ARCHITECTURE arq_jk OF flipflopJK IS
BEGIN
    PROCESS (clk, j, k)
        VARIABLE Qn : STD_LOGIC := '0';
    BEGIN
        IF (clk = '1') THEN
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


-- ARCHITECTURE arq_jk OF flipflopJK IS
--     SIGNAL temp : STD_LOGIC;
-- BEGIN
--     PROCESS (clk)
--     BEGIN
--         IF rising_edge(clk) THEN
--             IF (j = '0' AND k = '0') THEN
--                 temp <= temp;
--             ELSIF (j = '0' AND k = '1') THEN
--                 temp <= '0';
--             ELSIF (j = '1' AND k = '0') THEN
--                 temp <= '1';
--             ELSIF (j = '1' AND k = '1') THEN
--                 temp <= NOT (temp);
--             END IF;
--         END IF;
--     END PROCESS;
--     q <= temp;
--     nq <= NOT temp;
-- END arq_jk;