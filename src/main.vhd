-- Experimental Microprocessor
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.memory;
use work.logic;

entity main is
    port(
        CLK100MHZ : in std_logic;
        SW : in std_logic_vector(15 downto 0);
        BTNC : in std_logic;
        LED : out std_logic_vector(15 downto 0)
    );
end main;

architecture Structural of main is

    -- Hardware signals
    signal system_clock : std_logic;

    -- Working memory control signals
    signal addr : std_logic_vector(memory.RAM_ADDR_WIDTH-1 downto 0) := (others => '0');
    signal write : std_logic := '0';
    signal i : std_logic_vector(memory.RAM_WIDTH-1 downto 0) := (others => '1');
    signal o : std_logic_vector(memory.RAM_WIDTH-1 downto 0);

begin

    -- Hardware to signal mapping
    -- (This is primarily to limit the number of times a rename must occur
    --  to switch between different physical implementations)
    system_clock <= CLK100MHZ;
    
    -- Working device memory
    working_memory : memory.ram
    port map(
        clk => system_clock,
        write => BTNC,
        addr => SW(memory.RAM_ADDR_WIDTH-1 downto 0),
        i => i,
        o => LED
    );
    
    -- ALU
    alu : logic.alu
    port map(
        clk => system_clock,
        a => SW,
        b => SW,
        c => logic.ADD,
        e => '1',
        o => i
    );

end Structural;
