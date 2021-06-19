LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY coder IS
    PORT (
        E : IN STD_LOGIC_VECTOR (1 DOWNTO 0);-- 2 bits
        Z, Y, sel : IN STD_LOGIC;
        display : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) -- 7 Bits
    );
END coder;
----
ARCHITECTURE arq_coder OF coder IS
    SIGNAL DZ, DY, mux : STD_LOGIC_VECTOR (3 DOWNTO 0);-- 4 Bits

BEGIN

    -- Deco Z
    PROCESS (DZ, E, Z)
    BEGIN
        IF Z = '1' THEN
            IF (E = "00") THEN
                DZ <= "0001";
            ELSIF (E = "01") THEN
                DZ <= "0010";
            ELSIF (E = "10") THEN
                DZ <= "0100";
            ELSE
                DZ <= "1000";
            END IF;
        ELSE
            DZ <= "0000";
        END IF;
    END PROCESS;

    PROCESS (DY, E, Y)
    BEGIN
        IF Y = '1' THEN
            --Secuencial
            CASE (E) IS
                WHEN "00" =>
                    DY <= "0001";
                WHEN "01" =>
                    DY <= "0010";
                WHEN "10" =>
                    DY <= "0100";
                WHEN "11" =>
                    DY <= "1000";
                WHEN OTHERS =>
                    DY <= "0000";
            END CASE;
        ELSE
            DY <= "0000";
        END IF;

    END PROCESS;

    WITH sel SELECT mux <=
        DZ WHEN '0',
        DY WHEN '1',
        "0000" WHEN OTHERS;

    -- catodo: prenden con 1
    display <= "1001111" WHEN mux = "0000" ELSE -- 0
        "0110000" WHEN mux = "0001" ELSE -- 1
        "1101101" WHEN mux = "0010" ELSE -- 2
        "0110011" WHEN mux = "0100" ELSE -- 4
        "1111111" WHEN mux = "1000" ELSE -- 8
        "0000000";

END arq_coder;