-- Data Memory 
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;

library memory;
use work.memory.all;


entity data_memory is 
    port(
        clk : in std_logic;
        addr : in word;
        d_in : in word;
        d_out : out word;
        rw : in std_logic;
    );
end entity data_memory;


architecture behavioural of data_memory is 

begin

end architecture behavioural;