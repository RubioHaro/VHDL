LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
----------------------------------------
ENTITY comp IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        c : OUT STD_LOGIC
    );
END comp;
----
ARCHITECTURE example OF comp IS
BEGIN
    PROCESS (a, b)
    BEGIN
        IF (a = b) THEN
            c <= '0';
        ELSE
            c <= '1';
        END IF;
    END PROCESS;
END example;