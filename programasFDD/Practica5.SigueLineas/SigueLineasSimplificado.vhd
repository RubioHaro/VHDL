library ieee;
use ieee.std_logic_1164.all;

entity siguelineas is port(
    md, mi : out std_logic;
    sd, si : in std_logic
);

end siguelineas;

architecture arch_siguelineas of siguelineas is
begin

    md <= si;
    mi <= sd;

end arch_siguelineas ; -- arch_siguelineas
