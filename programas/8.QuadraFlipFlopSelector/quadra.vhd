LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
----------------------------------------
ENTITY quadraflop IS
    PORT (
        clk, s, r, d, t, j, k, reset, s0, s1 : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC);
END quadraflop;
ARCHITECTURE example OF quadraflop IS
    COMPONENT flipflopSR PORT (clk, reset, s, r : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT flipflopD PORT (clk, reset, d : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT flipflopJK PORT (clk, reset, j, k : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT flipflopT PORT (clk, reset, t : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT mux PORT (s0, s1, c0, c1, c2, c3 : IN STD_LOGIC;
        q : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL q0, q1, q2, q3 : STD_LOGIC;
    SIGNAL nq0, nq1, nq2, nq3 : STD_LOGIC;
BEGIN

    ff_sr0 : flipflopSR PORT MAP(clk => clk, reset => reset, s => s, r => r, q => q0, nq => nq0);
    ff_d0 : flipflopD PORT MAP(clk => clk, reset => reset, d => d, q => q1, nq => nq1);
    ff_t0 : flipflopT PORT MAP(clk => clk, reset => reset, t => t, q => q2, nq => nq2);
    ff_jk0 : flipflopJK PORT MAP(clk => clk, reset => reset, j => j, k => k, q => q3, nq => nq3);

    mux0 : mux PORT MAP(s0 => s0, s1 => s1, c0 => q0, c1 => q1, c2 => q2, c3 => q3, q => q);
    nq <= NOT q;
END example;