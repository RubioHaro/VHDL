LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
ENTITY adder IS
    PORT (
        a, b : IN signed (3 DOWNTO 0);
        sum : OUT signed (3 DOWNTO 0);
    );
END adder;
----
ARCHITECTURE add OF adder IS
BEGIN
    sum <= a + b;
END add;