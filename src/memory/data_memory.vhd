-- Data Memory 
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;
use work.memory.all;


entity data_memory is 
    port(
        clk : in std_logic;
        addr : in word;
        d_in : in word;
        d_out : out word;
        rw : in std_logic
    );
end entity data_memory;


architecture architectural of data_memory is 

    component onboard_memory is 
        port(
            clk : in std_logic;
            en : in std_logic;
            addr : in word;
            d_in : in word;
            d_out : out word;
            rw : in std_logic
        );
    end component onboard_memory;

begin

    data_mem: onboard_memory 
        port map(
            clk => clk,
            en => '1',
            addr => addr,
            d_in => d_in,
            d_out => d_out,
            rw => rw
        );

end architecture architectural;