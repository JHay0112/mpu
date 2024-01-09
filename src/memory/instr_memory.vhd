-- Instruction Memory 
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;
use work.memory.all;


entity instr_memory is 
    port(
        clk : in std_logic;
        addr : in word;
        d_out : out word
    );
end entity instr_memory;


architecture architectural of instr_memory is 

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

    
    signal d_in : word := (others => 'X');

begin

    instr_mem: onboard_memory 
        port map(
            clk => clk,
            en => '1',
            addr => addr,
            d_in => d_in,
            d_out => d_out,
            rw => '0'
        );

end architecture architectural;