LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY coder IS
    PORT (
        input : IN STD_LOGIC_VECTOR (2 DOWNTO 0);-- 4 Bits
        display : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) -- 7 Bits
    );
END coder;
----
ARCHITECTURE arq_coder OF coder IS
BEGIN
    display <= "0000101" WHEN input = "000" ELSE
        "0011101" WHEN input = "001" ELSE
        "0111101" WHEN input = "010" ELSE
        "0000100" WHEN input = "011" ELSE
        "1111011" WHEN input = "100" ELSE
        "0011100" WHEN input = "101" ELSE
        "0011111" WHEN input = "110" ELSE
        "ZZZZZZZ";
    
END arq_coder;