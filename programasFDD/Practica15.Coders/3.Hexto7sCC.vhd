LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY coder IS
    PORT (
        input : IN STD_LOGIC_VECTOR (3 DOWNTO 0);-- 4 Bits
        display : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) -- 7 Bits
    );
END coder;
----
ARCHITECTURE arq_coder OF coder IS
BEGIN
    PROCESS (input)
    BEGIN
        CASE input IS

            WHEN "0000" => display <= "1111110";
            WHEN "0001" => display <= "0110000";
            WHEN "0010" => display <= "1101101";
            WHEN "0011" => display <= "1111001";
            WHEN "0100" => display <= "0110011";
            WHEN "0101" => display <= "1011011";
            WHEN "0110" => display <= "1011111";
            WHEN "0111" => display <= "1110000";
            WHEN "1000" => display <= "1111111";
            WHEN "1001" => display <= "1110011";
            WHEN "1010" => display <= "1110111";
            WHEN "1011" => display <= "0011111";
            WHEN "1100" => display <= "1001110";
            WHEN "1101" => display <= "0111101";
            WHEN "1110" => display <= "1001111";
            WHEN "1111" => display <= "1000111";
            WHEN OTHERS => display <= "ZZZZZZZ";

        END CASE;
    END PROCESS; -- identifier
END arq_coder;