-- Device configuration
--
-- Defines values that defined key properties of the device
-- i.e. the word width
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;

package config is 

    constant WORD_LEN : integer := 32;
    subtype word is std_logic_vector(WORD_LEN-1 downto 0);

end package;