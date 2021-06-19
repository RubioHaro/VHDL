LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY mux IS
    PORT (
        selA, selB : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        a, b, c, d : IN STD_LOGIC_VECTOR (1 DOWNTO 0); -- 2 Bits
        j, k, l, m : out STD_LOGIC_VECTOR (1 DOWNTO 0) -- 2 Bits

    );
END mux;
----
ARCHITECTURE arq_mux OF mux IS
    SIGNAL res : STD_LOGIC_VECTOR (1 DOWNTO 0);
BEGIN

    PROCESS (a, b, c, d, selA)
    BEGIN
        --Secuencial
        CASE (selA) IS
            WHEN "00" =>
                res(1 DOWNTO 0) <= a;
            WHEN "01" =>
                res(1 DOWNTO 0) <= b;
            WHEN "10" =>
                res(1 DOWNTO 0) <= c;
            WHEN "11" =>
                res(1 DOWNTO 0) <= d;
            WHEN OTHERS =>
                res <= "UU";
        END CASE;
    END PROCESS;

    PROCESS (selB)
    BEGIN
        j(1 DOWNTO 0) <= "00";
        k(1 DOWNTO 0) <= "00";
        l(1 DOWNTO 0) <= "00";
        m(1 DOWNTO 0) <= "00";
        --Secuencial
        CASE (selB) IS
            WHEN "00" =>
                j(1 DOWNTO 0) <= res;
            WHEN "01" =>
                k(1 DOWNTO 0) <= res;
            WHEN "10" =>
                l(1 DOWNTO 0) <= res;
            WHEN "11" =>
                m(1 DOWNTO 0) <= res;
            WHEN OTHERS =>
        END CASE;
    END PROCESS;

END arq_mux;
