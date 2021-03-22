LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MultiContador IS
    PORT (
        s, p : IN STD_LOGIC; -- s: 0 for Johnson and 1 for ring. p -> preset
        clk, reset : IN STD_LOGIC;
        salida : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END MultiContador;

ARCHITECTURE Arq_MultiContador OF MultiContador IS
    SIGNAL auxo : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
BEGIN
    PROCESS (clk, reset)

    BEGIN
        IF reset = '1' THEN
            auxo <= "00000000";
        ELSIF clk'event AND clk = '1' THEN
            CASE s IS
                    -- Johnson
                WHEN '0' =>
                    auxo(0) <= NOT auxo(7);
                    -- Ring
                WHEN '1' =>
                    IF p = '1' THEN
                        auxo(0) <= '1';
                    ELSE
                        auxo(0) <= auxo(7);
                    END IF;
                WHEN OTHERS =>
            END CASE;
            FOR i IN 0 TO 6 LOOP
                auxo(i + 1) <= auxo(i);
            END LOOP;
        END IF;

    END PROCESS;
    salida <= auxo;

END Arq_MultiContador;