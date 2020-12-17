LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY ContadorGray IS
    PORT (
        EN : IN STD_LOGIC;
        clk, reset : IN STD_LOGIC;
        salida : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END ContadorGray;

ARCHITECTURE Arq_ContadorGray OF ContadorGray IS
    SIGNAL A : STD_LOGIC := '0';
    SIGNAL B : STD_LOGIC := '0';
    SIGNAL C : STD_LOGIC := '0';
    SIGNAL D : STD_LOGIC := '0';
    SIGNAL aux : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

BEGIN
    PROCESS (clk, reset)

    BEGIN
        IF reset = '1' THEN
            A <= '0';
            B <= '0';
            C <= '0';
            D <= '0';
            aux <= "0000";

        ELSIF clk'event AND clk = '1' THEN
            IF EN = '1' THEN
                -- JA:  BC'D'
                -- KA:  B'D

                -- JB:  A'CD'
                -- KB:  ACD'

                -- D1:   CD' + A'B'D + ABD
                -- D2:   B'C' + AC' + A'BC + AB'D'

                IF ((B AND NOT C AND NOT D) /= (NOT B AND D)) THEN
                    A <= B AND NOT C AND NOT D;
                ELSIF ((B AND NOT C AND NOT D) = '1' AND (NOT B AND D) = '1') THEN
                    A <= NOT A; -- hacemos el Toogle 
                END IF;

                -- JB <= NOT A AND C AND NOT D;
                -- KB <= A AND C AND NOT D;

                IF ((NOT A AND C AND NOT D) /= (A AND C AND NOT D)) THEN
                    B <= NOT A AND C AND NOT D;
                ELSIF ((NOT A AND C AND NOT D) = '1' AND (A AND C AND NOT D) = '1') THEN
                    B <= NOT B; -- hacemos el Toogle 
                END IF;

                C <= (C AND NOT D) OR (NOT A AND NOT B AND D) OR (A AND B AND D);
                D <= (NOT B AND NOT C) OR (A AND NOT C) OR (NOT A AND B AND D) OR (A AND NOT B AND NOT D);

                aux(3) <= A;
                aux(2) <= B;
                aux(1) <= C;
                aux(0) <= D;

                CASE aux IS
                    WHEN "0000" =>
                        salida <= "0000101";
                    WHEN "0001" =>
                        salida <= "0011101";
                    WHEN "0010" =>
                        salida <= "0000101";
                    WHEN "0011" =>
                        salida <= "0111101";
                    WHEN "0100" =>
                        salida <= "0000101";
                    WHEN "0101" =>
                        salida <= "0011101";
                    WHEN "0110" =>
                        salida <= "0000100";
                    WHEN "0111" =>
                        salida <= "1111011";
                    WHEN "1010" =>
                        salida <= "1000111";
                    WHEN "1011" =>
                        salida <= "0011101";
                    WHEN "1100" =>
                        salida <= "0011101";
                    WHEN "1101" =>
                        salida <= "0111101";
                    WHEN "1110" =>
                        salida <= "0001110";
                    WHEN "1111" =>
                        salida <= "0011101";
                    WHEN OTHERS =>
                        -- Retencion
                END CASE;

            END IF;
        END IF;

    END PROCESS;
END Arq_ContadorGray;