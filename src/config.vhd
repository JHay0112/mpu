-- Device configuration
--
-- Defines values that defined key properties of the device
-- i.e. the word width
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;


package config is 

    constant CLOCK_PERIOD : time := 1 ns;

    constant BYTE_LEN : integer := 8; -- bits

    constant DATA_WORD_LEN : integer := 4; -- bytes
    constant INSTR_WORD_LEN : integer := 4; -- bytes

    constant DATA_MEM_SIZE : integer := 1024 * DATA_WORD_LEN; -- bytes
    constant INSTR_MEM_SIZE : integer := 512 * INSTR_WORD_LEN; -- bytes

end package;