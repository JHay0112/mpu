-- Experimental Microprocessor
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.memory;

entity main is
    port(
        clk_100mhz : in std_logic
    );
end main;

architecture Structural of main is

    signal addr : std_logic_vector(memory.RAM_ADDR_WIDTH-1 downto 0) := (others => '0');
    signal write : std_logic := '0';
    signal i : std_logic_vector(memory.RAM_WIDTH-1 downto 0) := (others => '1');
    signal o : std_logic_vector(memory.RAM_WIDTH-1 downto 0);
    

begin

    working_memory : memory.ram
    port map(
        clk => clk_100mhz,
        write => write,
        addr => addr,
        i => i,
        o => o
    );

end Structural;
