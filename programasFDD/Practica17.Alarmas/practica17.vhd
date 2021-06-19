LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Alarmas IS
    PORT (
        a : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        b : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        ref : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        sel : IN STD_LOGIC;
        display : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
        -- Cout : OUT STD_LOGIC;
    );

END Alarmas;

ARCHITECTURE arq_Alarmas OF Alarmas IS
    SIGNAL mux : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
    SIGNAL res : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
BEGIN

    PROCESS (a, b, sel)
    BEGIN
        -- Mux
        CASE (sel) IS
            WHEN '0' =>
                mux <= b;
            WHEN OTHERS =>
                mux <= a;
        END CASE;

        -- comparador
        IF mux < ref THEN
            res <= "001";
        ELSIF mux = ref THEN
            res <= "010";
        ELSE
            res <= "100";
        END IF;
    END PROCESS;

    display <= "0001101" WHEN res = "001" ELSE
        "0001001" WHEN res = "010" ELSE
        "0011001" WHEN res = "100" ELSE
        "ZZZZZZZ";

END arq_Alarmas;