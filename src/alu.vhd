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
--  o: Output.
--  r: Ready flag, active high.
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;

library work;
-- This import of logic is a suspect circular import however
-- no errors have been thrown as a result.
-- If this does throw an error it will be necessary to remove 
-- the operator type to a seperate library which will be messy :(
use work.logic;

entity alu is 
    generic(
        W : integer
    );
    port(
        clk : in std_logic;
        a : in std_logic_vector(W-1 downto 0);
        b : in std_logic_vector(W-1 downto 0);
        c : in logic.operator;
        e : in std_logic;
        o : out std_logic_vector(W-1 downto 0);
        r : out std_logic
    );
end alu;

architecture Behavioral of alu is

begin


end Behavioral;
