library ieee;
use ieee.std_logic_1164.all;

entity siguelineas is port(
    md, mi : out std_logic;
    sd, si : in std_logic
);

end siguelineas;

architecture arch_siguelineas of siguelineas is
begin

    md <= (si and sd) or (not sd and si);
    mi <= (si and sd) or (not si and sd);

end arch_siguelineas ; -- arch_siguelineas
