LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
----------------------------------------
ENTITY jkVbits IS
    PORT (
        clk, j, k : IN STD_LOGIC;
        vq, vnq : OUT STD_LOGIC
    );
END jkVbits;
----

ARCHITECTURE example OF jkVbits IS

    COMPONENT flipflopJK PORT (clk, j, k : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL q0, q1, q2, q3 : STD_LOGIC;
    SIGNAL nq0, nq1, nq2, nq3 : STD_LOGIC;
BEGIN
    fjk0 : flipflopJK PORT MAP(clk => clk, j => j, k => k, q => q0, nq => nq0);
    fjk1 : flipflopJK PORT MAP(clk => clk, j => q0, k => nq0, q => q1, nq => nq1);
    fjk2 : flipflopJK PORT MAP(clk => clk, j => q1, k => nq1, q => q2, nq => nq2);
    fjk3 : flipflopJK PORT MAP(clk => clk, j => q2, k => nq2, q => q3, nq => nq3);
    fjk4 : flipflopJK PORT MAP(clk => clk, j => q3, k => nq3, q => vq, nq => vnq);

END example;