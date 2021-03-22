LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY DetectorSecuencia IS
    PORT (
        entrada : IN STD_LOGIC;
        clk, reset : IN STD_LOGIC;
        salida : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END DetectorSecuencia;

ARCHITECTURE Arq_DetectorSecuencia OF DetectorSecuencia IS
    SIGNAL A, B, C : STD_LOGIC := '0';
    -- SIGNAL B : STD_LOGIC := '0';
    -- SIGNAL C : STD_LOGIC := '0';
    -- SIGNAL D : STD_LOGIC := '0';
    -- SIGNAL Z : STD_LOGIC := '0';

BEGIN
    PROCESS (clk, reset, entrada)

    BEGIN
        IF reset = '1' THEN
            A <= '0';
            B <= '0';
            C <= '0';
            -- Z <= '0';

        ELSIF clk'event AND clk = '1' THEN
            -- D1: A'BCD
            -- D2: A'BC' + A'B'CD 
            -- D3: B'C'D + A'BC'D'
            -- Z : A'BCD

            -- nota: D = entrada

            A <= NOT A AND B AND C AND entrada;
            B <= (NOT A AND B AND NOT C) OR (NOT A AND NOT B AND C AND entrada);
            C <= (NOT B AND NOT C AND entrada) OR (NOT A AND B AND NOT C AND NOT entrada);
            -- Z <= NOT A AND B AND C AND entrada;
        END IF;

        IF (NOT A AND B AND C AND entrada) = '1' THEN
            salida <= "1110111";
        ELSE
            salida <= "1001111";
        END IF;

    END PROCESS;
END Arq_DetectorSecuencia;