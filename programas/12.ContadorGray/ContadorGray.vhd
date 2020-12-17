LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY ContadorGray IS
    PORT (
        M, EN : IN STD_LOGIC;
        clk, reset : IN STD_LOGIC;
        salida : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END ContadorGray;

ARCHITECTURE Arq_ContadorGray OF ContadorGray IS
    SIGNAL A : STD_LOGIC := '0';
    SIGNAL B : STD_LOGIC := '0';
    SIGNAL C : STD_LOGIC := '0';
    SIGNAL aux : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";

BEGIN
    PROCESS (clk, reset)

    BEGIN
        IF reset = '1' THEN
            A <= '0';
            B <= '0';
            C <= '0';
            aux <= "000";
        ELSIF clk'event AND clk = '1' THEN
            IF EN = '1' THEN
				-- A:  A'B'C'M'+A'BC'M+ AB'C'M+ABC'M'
                -- B:  A'B'CM + A'BCM' + AB'CM' + ABCM
                -- C:   A'B'C'M + A'B'CM' + A'BC'M' + A'BCM + AB'C'M' + AB'CM + ABC'M + ABCM'
                A <= ((NOT A AND NOT B AND NOT C AND NOT M) OR (NOT A AND B AND NOT C AND M) OR (A AND NOT B AND NOT C AND M) OR (A AND B AND NOT C AND NOT M)) XOR A;
                B <= ((NOT A AND NOT B AND C AND M) OR (NOT A AND B AND C AND NOT M) OR (A AND NOT B AND C AND NOT M) OR (A AND B AND C AND M)) XOR B;
                C <= ((NOT A AND NOT B AND NOT C AND M) OR (NOT A AND NOT B AND C AND NOT M) OR(NOT A AND B AND NOT C AND NOT M) OR(NOT A AND B AND C AND M) OR(A AND NOT B AND NOT C AND NOT M) OR (A AND NOT B AND C AND M) OR (A AND NOT B AND C AND M) OR (A AND B AND NOT C AND M) OR (A AND B AND C AND NOT M)) XOR C;

                aux(2) <= A;
                aux(1) <= B;
                aux(0) <= C;
            END IF;
        END IF;
        salida <= aux;

    END PROCESS;
END Arq_ContadorGray;