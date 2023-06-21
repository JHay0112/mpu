-- Logic package
-- Defines key logical components such as control and ALU.
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;

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
    constant ALU_WORD_WIDTH : integer := 16;
    
    -- ALU specification
    component alu is
        generic(
            W : integer := ALU_WORD_WIDTH
        );
        port(
            clk : in std_logic;
            a : in std_logic_vector(W-1 downto 0);
            b : in std_logic_vector(W-1 downto 0);
            c : in operator;
            e : in std_logic;
            o : out std_logic_vector(W-1 downto 0)
        );
    end component;

end package;
