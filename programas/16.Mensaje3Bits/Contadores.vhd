LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Mensaje3Bits IS
    PORT (
        clk : IN STD_LOGIC;
        an1, an2, an3 : OUT STD_LOGIC;
        salida : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)

    );
END Mensaje3Bits;

ARCHITECTURE Arq_Mensaje3Bits OF Mensaje3Bits IS
    SIGNAL auxo : STD_LOGIC_VECTOR(2 DOWNTO 0) := "001";
    SIGNAL disp : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
    PROCESS (clk)
    BEGIN
        IF clk'event AND clk = '1' THEN

            CASE(auxo) IS
                WHEN "001" =>
                disp <= "0110000"; -- I
                WHEN "010" =>
                disp <= "1100111"; -- P
                WHEN "100" =>
                disp <= "0010101"; -- N
                WHEN OTHERS =>
                auxo <= "001";
                disp <= "0000000";

            END CASE;
            -- Ring counter
            auxo(0) <= auxo(2);
            auxo(1) <= auxo(0);
            auxo(2) <= auxo(1);

        END IF;

    END PROCESS;
    salida <= disp;
    an1 <= NOT auxo(2);
    an2 <= NOT auxo(1);
    an3 <= NOT auxo(0);

END Arq_Mensaje3Bits;