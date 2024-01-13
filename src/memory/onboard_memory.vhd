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
    generic(
        WORD_LEN : integer;
        ADDR_LEN : integer
    );
    port(
        clk : in std_logic;
        en : in std_logic;
        addr : in std_logic_vector(ADDR_LEN-1 downto 0);
        d_in : in std_logic_vector(WORD_LEN-1 downto 0);
        d_out : out std_logic_vector(WORD_LEN-1 downto 0);
        rw : in std_logic
    );
end entity onboard_memory;


architecture behavioural of onboard_memory is 

    type data is array(2**ADDR_LEN-1 downto 0) of std_logic_vector(BYTE_LEN-1 downto 0);

begin

    

end architecture behavioural;