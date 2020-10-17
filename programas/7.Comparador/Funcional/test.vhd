-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component comp is
port(
  a: in STD_LOGIC_VECTOR(3 DOWNTO 0);
  b: in STD_LOGIC_VECTOR(3 DOWNTO 0);
  c: out std_logic);
end component;

signal a_in, b_in : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal c_out: std_logic;

begin

  -- Connect DUT
  DUT: comp port map(a_in, b_in, c_out);

  process
  begin
    a_in <= "1000";
    b_in <= "1000";
    wait for 1 ns;
    assert(c_out='0') report "Fail 0/0" severity error;
    
    a_in <= "0100";
    b_in <= "1000";
    wait for 1 ns;
    assert(c_out='1') report "Fail 0/0" severity error;
    
    -- Clear inputs
    a_in <= "0000";
    b_in <= "0000";

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
