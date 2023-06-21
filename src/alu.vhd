-- Arithmetic Logic Unit
--
-- Generics:
--  W: The width of the word the ALU operates on.
--
-- Inputs:
--  clk: Clock signal.
--  a: First operand.
--  b: Second operand.
--  c: Operator.
--  e: Enable signal, active high.
--  o: Output
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
-- This import of logic is a suspect circular import however
-- no errors have been thrown as a result.
-- If this does throw an error it will be necessary to remove 
-- the operator type to a seperate library which will be messy :(
use work.logic.operator;

entity alu is 
    generic(
        W : integer
    );
    port(
        clk : in std_logic;
        a : in std_logic_vector(W-1 downto 0);
        b : in std_logic_vector(W-1 downto 0);
        c : in operator;
        e : in std_logic;
        o : out std_logic_vector(W-1 downto 0)
    );
end alu;

architecture Behavioral of alu is

begin

    -- Clock driven process
    process(clk)
    begin
        -- On clock rising edge
        if (clk'event and clk = '1') then
            -- If the ALU is enabled
            if (e = '1') then
                -- Determine operation by operator register
                case (c) is
                    when ADD =>
                        o <= std_logic_vector(unsigned(a) + unsigned(b));
                    when SUB =>
                        o <= std_logic_vector(unsigned(a) - unsigned(b));
                end case;
            end if;
        end if;
    end process;

end Behavioral;
