LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY deco IS
    PORT (
        E : IN STD_LOGIC_VECTOR (1 DOWNTO 0);-- 2 Bits
        Z : IN STD_LOGIC; -- 1 Bit
        SDA : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 4 Bits
        SDB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) -- 4 Bits
    );
END deco;
----
ARCHITECTURE arq_deco OF deco IS
    -- SIGNAL SDB_temp : STD_LOGIC_VECTOR (3 DOWNTO 0);
    -- SIGNAL Y : STD_LOGIC;
BEGIN
    -- DecoA
    PROCESS (E, Z)
    BEGIN
        IF Z = '1' THEN
            IF (E = "00") THEN
                SDA <= "0001";
            ELSIF (E = "01") THEN
                SDA <= "0010";
            ELSIF (E = "10") THEN
                SDA <= "0100";
            ELSE
                SDA <= "1000";
            END IF;
        ELSE
            SDA <= "0000";
        END IF;
    END PROCESS;

    -- DecoB
    SDB <= "0001" WHEN (E = "00" AND (NOT Z) = '1') ELSE
        "0010" WHEN (E = "01" AND (NOT Z) = '1') ELSE
        "0100" WHEN (E = "10" AND (NOT Z) = '1') ELSE
        "1000" WHEN (E = "11" AND (NOT Z) = '1') ELSE
        "0000" WHEN ((NOT Z) = '0') ELSE
        "ZZZZ";

    -- WITH E SELECT SDB_temp <=
    --     "0001" WHEN "00",
    --     "0010" WHEN "01",
    --     "0100" WHEN "10",
    --     "1000" WHEN "11",
    --     "ZZZZ" WHEN OTHERS;

    -- Y <= NOT Z;
    -- WITH Y SELECT SDB <=
    --     SDB_temp WHEN '1',
    --     "0000" WHEN '0',
    --     "ZZZZ" WHEN OTHERS;

END arq_deco;