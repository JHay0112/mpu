-- Memory package
-- Defines the processor's memory and the method of access.
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;

package memory is 

    -- Register configuration
    constant NUM_REGISTERS : integer := 16; -- Does not include P.C.
    constant REGISTER_ADDR_WIDTH : integer := 4;

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
    
    -- Register specification
    component registers is 
        generic(
            W : integer := WORD_WIDTH;
            N : integer := NUM_REGISTERS + 1;
            A : integer := REGISTER_ADDR_WIDTH
        );
        port(
            clk: std_logic;
            addr : in std_logic_vector(A-1 downto 0);
            write : in std_logic;
            i : in word;
            o : out word
        );
    end component registers;
    
    -- RAM configuration
    constant RAM_ADDR_WIDTH : integer := 8;
    
    -- RAM specification
    component ram is
        generic(
            W : integer := WORD_WIDTH;
            N : integer := 2**RAM_ADDR_WIDTH;
            A : integer := RAM_ADDR_WIDTH
        );
        port(
            clk: std_logic;
            addr : in std_logic_vector(A-1 downto 0);
            write : in std_logic;
            i : in word;
            o : out word
        );
    end component ram;

end package memory;
