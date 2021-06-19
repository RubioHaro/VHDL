LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY deco IS
    PORT (
        E : IN STD_LOGIC_VECTOR (1 DOWNTO 0);-- 2 Bits
        Z, Y : IN STD_LOGIC; -- 1 Bit
        SDA : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 4 Bits
        SDB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) -- 4 Bits
    );
END deco;
----
ARCHITECTURE arq_deco OF deco IS
BEGIN
    -- DecoA
    PROCESS (E, Z)
    BEGIN
        IF Z = '1' THEN
            CASE E IS
                WHEN "00" => SDA <= "0001";
                WHEN "01" => SDA <= "0010";
                WHEN "10" => SDA <= "0100";
                WHEN "11" => SDA <= "1000";
                WHEN OTHERS => SDA <= "ZZZZ";
            END CASE;
        ELSE
            SDA <= "0000";
        END IF;
    END PROCESS;

    -- DecoB
    SDB <= "0001" WHEN (E = "00" AND Y = '1') ELSE
        "0010" WHEN (E = "10" AND Y = '1') ELSE
        "0100" WHEN (E = "01" AND Y = '1') ELSE
        "1000" WHEN (E = "11" AND Y = '1') ELSE
        "0000" WHEN (Y = '0') ELSE
        "ZZZZ";

END arq_deco;