LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY RegistroUniversal IS
    PORT (
        Dn : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        es : IN STD_LOGIC;
        clk, reset : IN STD_LOGIC;
        oper : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        salida : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END RegistroUniversal;

ARCHITECTURE Arq_RegistroUniversal OF RegistroUniversal IS
    SIGNAL auxo : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    PROCESS (clk, reset, oper)

    BEGIN
        IF reset = '1' THEN
            auxo <= "00000000";
        ELSIF clk'event AND clk = '1' THEN
            CASE oper IS
                    -- Desplazamiento a la derecha
                WHEN "11" =>
                    FOR i IN 0 TO 6 LOOP
                        auxo(i + 1) <= auxo(i);
                    END LOOP;
                    auxo(0) <= es;
                WHEN "01" =>
                    -- Desplazamiento a la izquierda
                    auxo(7) <= es;
                    FOR i IN 0 TO 6 LOOP
                        auxo(i) <= auxo(i + 1);
                    END LOOP;
                    -- Carga en Paralelo
                WHEN "10" => auxo <= Dn;

                WHEN OTHERS =>
                    -- Retencion
            END CASE;
        END IF;

    END PROCESS;
    salida <= auxo;

END Arq_RegistroUniversal;