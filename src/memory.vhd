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
    constant NUM_REGISTERS : integer := 16;
    constant REGISTER_ADDR_WIDTH : integer := 4;
    
    -- Register specification
    component registers is 
        generic(
            W : integer := WORD_WIDTH;
            N : integer := NUM_REGISTERS;
            A : integer := REGISTER_ADDR_WIDTH
        );
        port(
            clk: std_logic;
            addr : in std_logic_vector(A-1 downto 0);
            write : in std_logic;
            i : in std_logic_vector(W-1 downto 0);
            o : out std_logic_vector(W-1 downto 0)
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
            i : in std_logic_vector(W-1 downto 0);
            o : out std_logic_vector(W-1 downto 0)
        );
    end component ram;

end package memory;
