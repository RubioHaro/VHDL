---------------------RRRH---------------------
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
    WITH (a = b) SELECT
    c <= '0' WHEN true,
        '1' WHEN OTHERS;
END example;
---------------------RRRH---------------------


