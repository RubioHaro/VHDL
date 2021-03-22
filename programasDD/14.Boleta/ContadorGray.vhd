LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY ContadorGray IS
    PORT (
        D : IN STD_LOGIC;
        clk, reset : IN STD_LOGIC;
        salida : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END ContadorGray;

ARCHITECTURE Arq_ContadorGray OF ContadorGray IS
    SIGNAL A : STD_LOGIC := '0';
    SIGNAL B : STD_LOGIC := '0';
    SIGNAL C : STD_LOGIC := '0';
    SIGNAL aux : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";

BEGIN
    PROCESS (clk, reset, D)

    BEGIN
        IF reset = '1' THEN
            A <= '0';
            B <= '0';
            C <= '0';
            aux <= "000";

        ELSIF clk'event AND clk = '1' THEN

            -- JA: B'C'D' + BC'D
            -- KA: B'C'D + BC'D'

            IF (((NOT B AND NOT C AND NOT D) OR (B AND NOT C AND D)) /= ((NOT B AND NOT C AND D) OR (B AND NOT C AND NOT D))) THEN
                A <= ((NOT B AND NOT C AND NOT D) OR (B AND NOT C AND D));
            ELSIF (((NOT B AND NOT C AND NOT D) OR (B AND NOT C AND D)) = '1' AND ((NOT B AND NOT C AND D) OR (B AND NOT C AND NOT D)) = '1') THEN
                A <= NOT A; -- hacemos el Toogle 
            END IF;

            -- T:  A'B'CD + A'BCD' + AB'CD' + ABCD
            B <= B XOR ((NOT A AND NOT B AND C AND D) OR (NOT A AND B AND C AND NOT D) OR (A AND NOT B AND C AND NOT D) OR (A AND B AND C AND D));

            -- D:  A'B'D + A'BD' + AB'D' + ABD

            C <= (NOT A AND NOT B AND D) OR (NOT A AND B AND NOT D) OR (A AND NOT B AND NOT D) OR (A AND B AND D);

            aux(2) <= A;
            aux(1) <= B;
            aux(0) <= C;
        END IF;
        CASE aux IS
            WHEN "000" =>
                salida <= "1101101";
            WHEN "001" =>
                salida <= "1111110";
            WHEN "010" =>
                salida <= "1111011";
            WHEN "011" =>
                salida <= "0110000";
            WHEN "100" =>
                salida <= "1110000";
            WHEN "101" =>
                salida <= "1011011";
            WHEN "110" =>
                salida <= "1011111";
            WHEN "111" =>
                salida <= "1111001";
            WHEN OTHERS =>
                -- Retencion
        END CASE;
        
    END PROCESS;
END Arq_ContadorGray;