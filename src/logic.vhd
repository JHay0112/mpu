-- Logic package
-- Defines key logical components such as control and ALU.
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;

package logic is 

    -- Control logic configuration

    -- Control logic specification
    component control is
    
    end component;
    
    -- ALU configuration
    type operator is (
        ADD,
        SUB
    );
    
    -- ALU specification
    component alu is
        generic(
            W : integer := WORD_WIDTH
        );
        port(
            clk : in std_logic;
            a : in word;
            b : in word;
            c : in operator;
            e : in std_logic;
            o : out word
        );
    end component;

end package;
