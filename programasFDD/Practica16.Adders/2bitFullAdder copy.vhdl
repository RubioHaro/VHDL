LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TwoFulladder IS
    PORT (
        a : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        b : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        sum : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        Cout : OUT STD_LOGIC;
        Cin : IN STD_LOGIC);

END TwoFulladder;

ARCHITECTURE arq_TwoFulladder OF TwoFulladder IS
    SIGNAL C : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";

BEGIN
    sum(0) <= a(0) XOR b(0) XOR Cin;
    C(0) <= (a(0) AND b(0)) OR (Cin AND a(0)) OR (Cin AND b(0));
    sum(1) <= a(1) XOR b(1) XOR C(0);
    C(1) <= (a(1) AND b(1)) OR (C(0) AND a(1)) OR (C(0) AND b(1));
    Cout <= C(1);

END arq_TwoFulladder;