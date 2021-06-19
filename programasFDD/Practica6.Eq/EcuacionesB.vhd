LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY compuertas IS PORT (
    x, y, z : IN STD_LOGIC;
    Eq1, Eq2 : OUT STD_LOGIC
);

END compuertas;

ARCHITECTURE arch_compuertas OF compuertas IS
BEGIN
    -- Eq1 = (x.y' + z)'
    -- Eq2 = x.z' + y.z'
    Eq1 <= NOT ((x AND NOT y) or z);
    Eq2 <= (not x AND NOT z) OR (y AND NOT z);

END arch_compuertas; -- arch_compuertas