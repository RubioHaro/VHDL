----------------------------------------
ENTITY mux IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        c : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END mux;
----
ARCHITECTURE example OF mux IS
BEGIN
    PROCESS (a, b, sel)
    BEGIN
        IF (sel = "00") THEN
            c <= "00000";
        ELSIF (sel = "01") THEN
            c <= a;
        ELSIF (sel = "10") THEN
            c <= b;
        ELSE
            c <= (OTHERS => 'Z');
        END IF;
    END PROCESS;
END example;