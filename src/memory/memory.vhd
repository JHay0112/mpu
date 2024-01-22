-- Memory package
--
-- Defines the processor's memory and the method of access. Addressing is always done in terms of
-- bytes but words are selected
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;
use work.math.log2;


package memory is 

    constant DATA_MEM_ADDR_LEN : integer := log2(DATA_MEM_SIZE/BYTE_LEN);
    constant INSTR_MEM_ADDR_LEN : integer := log2(INSTR_MEM_SIZE/BYTE_LEN);

    component data_memory is 
        generic(
            WORD_LEN : integer := DATA_WORD_LEN;
            ADDR_LEN : integer := DATA_MEM_ADDR_LEN
        );
        port(
            clk : in std_logic;
            addr : in std_logic_vector(ADDR_LEN-1 downto 0);
            d_in : in std_logic_vector(WORD_LEN-1 downto 0);
            d_out : out std_logic_vector(WORD_LEN-1 downto 0);
            rw : in std_logic
        );
    end component data_memory;

    component instr_memory is 
        generic(
            WORD_LEN : integer := INSTR_WORD_LEN;
            ADDR_LEN : integer := INSTR_MEM_ADDR_LEN
        );
        port(
            clk : in std_logic;
            addr : in std_logic_vector(ADDR_LEN-1 downto 0);
            d_out : out std_logic_vector(WORD_LEN-1 downto 0)
        );
    end component instr_memory;
    
end package memory;
