LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fulladder IS
    PORT (
        a, b, c : IN BIT;
        sum, carry : OUT BIT);
END ENTITY fulladder;
----
ARCHITECTURE arq_fulladder OF fulladder IS
BEGIN
    sum <= a XOR b XOR c;
    carry <= (a AND b) OR (b AND c) OR (a AND c);
END arq_fulladder;