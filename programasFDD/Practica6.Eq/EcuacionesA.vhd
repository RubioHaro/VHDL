LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY compuertas IS PORT (
    x, y, z : IN STD_LOGIC;
    Eq1, Eq2 : OUT STD_LOGIC
);

END compuertas;

ARCHITECTURE arch_compuertas OF compuertas IS
BEGIN
    -- Eq1 = x.z' + y'.z' + x.z + y'.z
    -- Eq2 = x+y'
    Eq1 <= (x AND NOT z) OR (NOT y AND NOT z) OR (x AND z) OR (NOT y AND z);
    Eq2 <= x OR NOT y;

END arch_compuertas; -- arch_compuertas