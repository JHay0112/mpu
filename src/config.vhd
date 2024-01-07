-- Device configuration
--
-- Defines values that defined key properties of the device
-- i.e. the word width
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;

package config is 

    constant BYTE_LEN : integer := 8; -- Bits
    subtype byte is std_logic_vector(BYTE_LEN-1 downto 0);

    constant WORD_LEN : integer := 4; -- Bytes
    subtype word is std_logic_vector(BYTE_LEN*WORD_LEN-1 downto 0);

end package;