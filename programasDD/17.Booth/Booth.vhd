LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Mensaje3Bits IS
    PORT (
        m, r : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        salida : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

    );
END Mensaje3Bits;

ARCHITECTURE Arq_Mensaje3Bits OF Mensaje3Bits IS
    -- SIGNAL aux : STD_LOGIC_VECTOR(8 DOWNTO 0) := "00000000";
    -- SIGNAL A, S, P : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";

    -- SIGNAL acumulador : STD_LOGIC_VECTOR(3 DOWNTO 0);
    -- SIGNAL arrastre : STD_LOGIC;
BEGIN
    PROCESS (m, r)
        CONSTANT X_ZEROS : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
        CONSTANT Y_ZEROS : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');

        VARIABLE a, s, p : STD_LOGIC_VECTOR(8 DOWNTO 0);
        VARIABLE mn : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN


            a := (OTHERS => '0');
            s := (OTHERS => '0');
            p := (OTHERS => '0');

            IF (m /= X_ZEROS AND r /= Y_ZEROS) THEN

                a(8 DOWNTO 5) := m;
                a(9) := m(3);

                mn := (NOT m) + 1;

                s(8 DOWNTO 5) := mn;
                s(8 + 1) := NOT(m(3));

                p(4 DOWNTO 1) := r;

                FOR i IN 1 TO 4 LOOP

                    IF (p(1 DOWNTO 0) = "01") THEN
                        p := p + a;
                    ELSIF (p(1 DOWNTO 0) = "10") THEN
                        p := p + s;
                    END IF;

                    -- Shift Right Arithmetic
                    p(8 DOWNTO 0) := p(9 DOWNTO 1);

                END LOOP;

            END IF;

            salida <= p(8 DOWNTO 1);

            -- A <= multndo;
            -- S <= compto2(multndo);
            -- P <= multdor;

    END PROCESS;

END Arq_Mensaje3Bits;