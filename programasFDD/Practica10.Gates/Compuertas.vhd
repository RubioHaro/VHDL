LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY entidad_compuertas IS
    PORT (
        a, b : IN STD_LOGIC;
        c1, c2, c3, c4, c5, c6, c7 : OUT STD_LOGIC
    );
END entidad_compuertas;

ARCHITECTURE arq_compuertas OF entidad_compuertas IS
BEGIN
    c1 <= a AND b;
    c2 <= a NAND b;
    c3 <= a OR b;
    c4 <= a NOR b;
    c5 <= a XOR b;
    c6 <= a XNOR b;
    c7 <= NOT a;
END arq_compuertas; -- arq


