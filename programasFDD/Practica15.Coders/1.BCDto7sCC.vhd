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
    -- coderA
    PROCESS (input, Z)
    BEGIN
        IF (input = "0000") THEN
            display <= "1111110";
        ELSIF (input = "0001") THEN
            display <= "0110000";
        ELSIF (input = "0010") THEN
            display <= "1101101";
        ELSIF (input = "0011") THEN
            display <= "1111001";
        ELSIF (input = "0100") THEN
            display <= "0110011";
        ELSIF (input = "0101") THEN
            display <= "1011011";
        ELSIF (input = "0110") THEN
            display <= "1011111";
        ELSIF (input = "0111") THEN
            display <= "1110000";
        ELSIF (input = "1000") THEN
            display <= "1111111";
        ELSIF (input = "1001") THEN
            display <= "1110011";
        -- ELSIF (input = "1011") THEN
        -- ELSIF (input = "1100") THEN
        -- ELSIF (input = "1101") THEN
        -- ELSIF (input = "1110") THEN
        -- ELSIF (input = "1111") THEN
        ELSE
            display <= "ZZZZZZZ";
        END IF;
    END PROCESS;


                                 C22V10
                 __________________________________________
       input(3) =| 1|                                  |24|* not used       
       input(2) =| 2|                                  |23|= display(1)     
       input(1) =| 3|                                  |22|= display(5)     
       input(0) =| 4|                                  |21|= display(0)     
       not used *| 5|                                  |20|= display(4)     
       not used *| 6|                                  |19|* not used       
       not used *| 7|                                  |18|* not used       
       not used *| 8|                                  |17|= (display(6)_.. 
       not used *| 9|                                  |16|= display(2)     
       not used *|10|                                  |15|= display(6)     
       not used *|11|                                  |14|= display(3)     
       not used *|12|                                  |13|* not used       
                 __________________________________________


END arq_coder;