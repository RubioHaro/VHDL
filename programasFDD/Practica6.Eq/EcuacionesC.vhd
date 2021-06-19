LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY compuertas IS PORT (
    x, y, z, w : IN STD_LOGIC;
    Eq1, Eq2 : OUT STD_LOGIC
);

END compuertas;

ARCHITECTURE arch_compuertas OF compuertas IS
BEGIN
    -- Eq1 = x.y'.z + w.y.z + w.x'.z 
    -- Eq2 = x.y'.z + w.z
    Eq1 <= (x AND NOT y AND z) OR (w AND y AND z) OR (w AND NOT x AND z);
    Eq2 <= (x AND NOT y AND z) OR (w AND z);

END arch_compuertas; -- arch_compuertas
