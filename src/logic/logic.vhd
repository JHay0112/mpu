-- Logic package
-- Defines key logical components such as control and ALU.
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;

package logic is 

    
    component control is
    
    end component;


    constant OPCODE_LEN : integer := 7;
    subtype opcode is std_logic_vector(OPCODE_LEN-1 downto 0);
    
    -- ALU specification
    component alu is
        generic(
            W : integer := WORD_LEN
        );
        port(
            clk : in std_logic;
            a : in word;
            b : in word;
            c : in opcode;
            e : in std_logic;
            o : out word
        );
    end component;

end package;
