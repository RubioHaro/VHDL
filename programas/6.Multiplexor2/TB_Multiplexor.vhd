-- Testbench for OR gate
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY testbench IS
  -- empty
END testbench;

ARCHITECTURE tb OF testbench IS

  -- DUT component
  COMPONENT mux IS
    PORT (
      a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      c : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;

  SIGNAL a_in, b_in, c_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL sel_in : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN

  -- Connect DUT
  DUT : mux PORT MAP(a_in, b_in, sel_in, c_out);

  PROCESS
  BEGIN
    a_in <= "00000000";
    b_in <= "00000001";
    sel_in <= "00";
    WAIT FOR 1 ns;
    ASSERT(c_out = "00000000") REPORT "Fail 0/0" SEVERITY error;

    a_in <= "00000000";
    b_in <= "00000001";
    sel_in <= "01";
    WAIT FOR 1 ns;
    ASSERT(c_out = "00000000") REPORT "Fail 0/0" SEVERITY error;

    a_in <= "00000000";
    b_in <= "00000001";
    sel_in <= "10";
    WAIT FOR 1 ns;
    ASSERT(c_out = "00000001") REPORT "Fail 0/0" SEVERITY error;

    -- a_in <= "00000000";
    -- b_in <= "00000001";
    -- sel_in <= "10";
    -- WAIT FOR 1 ns;
    -- ASSERT(c_out = "z") REPORT "Fail 0/0" SEVERITY error;

    -- Clear inputs
    a_in <= "00000000";
    b_in <= "00000000";
    sel_in <= "00";
    c_out <= "00000000";

    ASSERT false REPORT "Test done." SEVERITY note;
    WAIT;
  END PROCESS;
END tb;