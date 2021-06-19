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
    WITH input SELECT display <=
        "0000001" WHEN "0000",
        "1001111" WHEN "0001",
        "0010010" WHEN "0010",
        "0000110" WHEN "0011",
        "1001100" WHEN "0100",
        "0100100" WHEN "0101",
        "0100000" WHEN "0110",
        "0001111" WHEN "0111",
        "0000000" WHEN "1000",
        "0001100" WHEN "1001",
        "ZZZZZZZ" WHEN OTHERS;

        

                                 C22V10
                 __________________________________________
       input(3) =| 1|                                  |24|* not used       
       input(2) =| 2|                                  |23|= display(1)     
       input(1) =| 3|                                  |22|= display(5)     
       input(0) =| 4|                                  |21|= display(0)     
       not used *| 5|                                  |20|= display(4)     
       not used *| 6|                                  |19|* not used       
       not used *| 7|                                  |18|* not used       
       not used *| 8|                                  |17|= (display(4)_.. 
       not used *| 9|                                  |16|= display(2)     
       not used *|10|                                  |15|= display(6)     
       not used *|11|                                  |14|= display(3)     
       not used *|12|                                  |13|* not used       
                 __________________________________________



END arq_coder;

