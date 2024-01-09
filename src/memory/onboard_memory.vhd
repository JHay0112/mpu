-- Memory implemented in the FPGA. 
-- This would typically be data intended to be accessed very quickly. For large sets of data
-- consider accessing off-chip memory through some interface to save logic cells on the FPGA.
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;


entity onboard_memory is 
    port(
        clk : in std_logic;
        en : in std_logic;
        addr : in word;
        d_in : in word;
        d_out : out word;
        rw : in std_logic
    );
end entity onboard_memory;


architecture behavioural of onboard_memory is 

begin

end architecture behavioural;