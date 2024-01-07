-- Instruction Memory 
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;

library memory;
use work.memory.all;


entity instr_memory is 
    port(
        clk : in std_logic;
        addr : in word;
        d_in : in word;
        d_out : out word;
        rw : in std_logic;
    );
end entity instr_memory;


architecture behavioural of instr_memory is 
    
begin

end architecture behavioural;