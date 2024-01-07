-- Memory package
--
-- Defines the processor's memory and the method of access.
-- Data and instruction word types are explicitly seperated from the word type defined in config.vhd
-- to ensure that they may be dealt with independently. Functions are provided to convert between
-- the types.
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;


package memory is 

    constant DATA_MEM_SIZE : integer := 1024; -- Bytes
    constant INSTR_MEM_SIZE : integer := 512; -- Words

    constant DATA_WORD_LEN : integer := 1; -- Bytes
    constant INSTR_WORD_LEN : integer := 4; -- Bytes


    -- Register adresses
    constant X0  : integer := 0;
    constant X1  : integer := 1;
    constant X2  : integer := 2;
    constant X3  : integer := 3;
    constant X4  : integer := 4;
    constant X5  : integer := 5;
    constant X6  : integer := 6;
    constant X7  : integer := 7;
    constant X8  : integer := 8;
    constant X9  : integer := 9;
    constant X10 : integer := 10;
    constant X11 : integer := 11;
    constant X12 : integer := 12;
    constant X13 : integer := 13;
    constant X14 : integer := 14;
    constant X15 : integer := 15;
    constant PC  : integer := 17; 

    
    -- Byte/word conversion
    type word_byte_array is array (WORD_LEN-1 downto 0) of byte;

    function word(
        bytes : word_byte_array
    ) return word;


    entity data_memory is 
        port(
            clk : in std_logic;
            addr : in word;
            d_in : in word;
            d_out : out word;
            rw : in std_logic;
        );
    end entity data_memory;

    entity instr_memory is 
        port(
            clk : in std_logic;
            addr : in word;
            d_in : in word;
            d_out : out word;
            rw : in std_logic;
        );
    end entity instr_memory;
    
end package memory;


package body memory is

    function word(
        bytes : word_byte_array
    ) return word is
        variable output : word := (others => '0');
    begin
        for i in 0 to WORD_LEN-1 loop
            output(i*WORD_LEN*BYTE_LEN downto (i-1)*WORD_LEN*BYTE_LEN) <= bytes(i);
        end loop;
        return output;
    end word;

end package body memory;
