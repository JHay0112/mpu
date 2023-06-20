-- Memory package
-- Defines the processor's memory and the method of access.
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;

package memory is 

    -- Register configuration
    constant REGISTER_WIDTH : integer := 16;
    constant NUM_REGISTERS : integer := 16;
    constant REGISTER_ADDR_WIDTH : integer := 4;
    
    -- RAM configuration
    constant RAM_WIDTH : integer := 16;
    constant RAM_ADDR_WIDTH : integer := 16;
    
    -- RAM specification
    component ram is
        generic(
            W : integer := RAM_WIDTH;
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
