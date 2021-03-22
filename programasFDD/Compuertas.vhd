LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY entidad_compuertas IS
    PORT (
        A, B, C : IN STD_LOGIC;
        s, Co : OUT STD_LOGIC
    );
END entidad_compuertas;

ARCHITECTURE arq_compuertas OF entidad_compuertas IS
BEGIN
    s <= (NOT A AND NOT B AND C) OR (NOT A AND B AND NOT C) OR (A AND NOT B AND NOT C) OR (A AND B AND C);
    Co <= (B AND C) OR (A AND C) OR (A AND B);
END arq_compuertas; -- arq


