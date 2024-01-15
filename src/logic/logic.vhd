-- Logic package
-- Defines key logical components such as control and ALU.
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;


package logic is 
    
    constant OPCODE_LEN : integer := 7;
    
    -- ALU specification
    component alu is
        generic(
            WORD_LEN : integer := DATA_WORD_LEN;
            OPCODE_LEN : integer := OPCODE_LEN
        );
        port(
            clk : in std_logic;
            a : in std_logic_vector(WORD_LEN-1 downto 0);
            b : in std_logic_vector(WORD_LEN-1 downto 0);
            c : in std_logic_vector(OPCODE_LEN-1 downto 0);
            e : in std_logic;
            o : out std_logic_vector(WORD_LEN-1 downto 0)
        );
    end component;

end package;
