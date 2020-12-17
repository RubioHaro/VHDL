LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY muxer IS
    PORT (
        operador1 : IN STD_LOGIC;
        operador2 : IN STD_LOGIC;
        canal1 : IN STD_LOGIC;
        canal2 : IN STD_LOGIC;
        canal3 : IN STD_LOGIC;
        canal4 : IN STD_LOGIC;
        salida : OUT STD_LOGIC);
END muxer;
----
ARCHITECTURE mux OF muxer IS
    SIGNAL inversor1 : STD_LOGIC;
    SIGNAL inversor2 : STD_LOGIC;
    SIGNAL compuerta1 : STD_LOGIC;
    SIGNAL compuerta2 : STD_LOGIC;
    SIGNAL compuerta3 : STD_LOGIC;
    SIGNAL compuerta4 : STD_LOGIC;

BEGIN
    inversor1 <= NOT operador1;
    inversor2 <= NOT operador2;

    compuerta1 <= canal1 AND inversor1 AND inversor2;
    compuerta2 <= canal2 AND operador1 AND inversor2;
    compuerta3 <= canal3 AND inversor1 AND operador2;
    compuerta4 <= canal4 AND operador1 AND operador2;

    salida <= compuerta1 OR compuerta2 OR compuerta3 OR compuerta4;
END mux;