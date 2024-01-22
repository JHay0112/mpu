-- RISC-V Core
-- Implements instruction execution, manipulation of registers, and control of busses.
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;
use work.instructions.all;


entity core is 
    generic(
        WORD_LEN : integer;
        INSTR_LEN : integer
    );
    port(
        clk : in std_logic;
        instr_bus : in std_logic_vector(INSTR_LEN-1 downto 0);
        instr_addr : out std_logic_vector(WORD_LEN-1 downto 0);
        data_bus : inout std_logic_vector(WORD_LEN-1 downto 0);
        mem_en : out std_logic;
        mem_rw : out std_logic;
    );
end entity data_memory;


architecture behavioural of core is 

    type reg_array is array NUM_REGISTERS-1 downto 0 of std_logic_vector(WORD_LEN-1 downto 0);

    signal registers : reg_array := (others => (others => '0'));
    signal pc : std_logic_vector(WORD_LEN-1 downto 0);

begin

    

end architecture behavioural;

