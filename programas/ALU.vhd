library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY alu IS
    PORT (
        A : IN std_logic (7 DOWNTO 0);
        B : IN std_logic (7 DOWNTO 0);
        operacion : IN std_logic (2 DOWNTO 0);
        resultado : OUT std_logic (7 DOWNTO 0));
END alu;

ARCHITECTURE Behavioral OF alu IS
BEGIN
    WITH operacion SELECT
        resultado <= A + B WHEN "000",
        A - B WHEN "001",
        A AND B WHEN OTHERS;

END Behavioral; -- Behavioral