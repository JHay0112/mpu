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

    constant DATA_MEM_ADDR_LEN : integer := log2(DATA_MEM_SIZE);
    constant INSTR_MEM_ADDR_LEN : integer := log2(INSTR_MEM_SIZE);

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


    component data_memory is 
        generic(
            WORD_LEN : integer := DATA_WORD_LEN*BYTE_LEN;
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
            WORD_LEN : integer := INSTR_WORD_LEN*BYTE_LEN;
            ADDR_LEN : integer := INSTR_MEM_ADDR_LEN
        );
        port(
            clk : in std_logic;
            addr : in std_logic_vector(ADDR_LEN-1 downto 0);
            d_out : out std_logic_vector(WORD_LEN-1 downto 0)
        );
    end component instr_memory;
    
end package memory;
