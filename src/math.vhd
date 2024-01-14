-- Common maths functions
--
-- Author: J. L. Hay


package math is
    
    pure function log2(x : positive) return natural;
    pure function clamp(x : natural; l : natural; u : natural) return natural;

end package;


package body math is 

    -- Logarithm base 2 calculation for integers.
    --
    -- Based upon https://stackoverflow.com/questions/12750007/vhdl-use-the-length-of-an-integer-generic-to-determine-number-of-select-lines
    pure function log2(x : positive) return natural is
        variable i : natural := 0;
    begin

        while (2**i < x) and (i < 31) loop
            i := i + 1;
        end loop;

        return i;

    end function;

    -- Value clamping
    pure function clamp(x : natural; l : natural; u : natural) return natural is
        variable o : natural := 0;
    begin

        if (x <= l) then
            o := l;
        elsif (x >= u) then
            o := u;
        else
            o := x;
        end if;

        return o;

    end function;

end package body;