-- Comentarios con --
-- Compuerta OR

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY compuerta_or IS
  PORT (
    entrada1 : IN STD_LOGIC;
    entrada2 : IN STD_LOGIC;
    salida : OUT STD_LOGIC);
END compuerta_or;

ARCHITECTURE Behavioral OF compuerta_or IS
BEGIN
  salida <= entrada1 OR entrada2;
END Behavioral; -- Behavioral