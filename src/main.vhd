-- Experimental Microprocessor
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.config.all;
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
    
    -- Main busses
    signal data_bus : word;
    signal addr_bus : std_logic_vector(memory.REGISTER_ADDR_WIDTH-1 downto 0);
    
    -- Selects which device to enable, used for bus selection
    type device is (
        REG,
        ALU    
    );
    signal enable : device := REG;
    
    -- ALU signals
    signal alu_a : word;
    signal alu_b : word;
    signal alu_c : logic.operator;
    signal alu_e : std_logic;
    signal alu_o : word;
    
    -- Register signals
    signal reg_write : std_logic := '0';
    signal reg_o : word;

begin

    -- Hardware to signal mapping
    -- (This is primarily to limit the number of times a rename must occur
    --  to switch between different physical implementations)
    system_clock <= CLK100MHZ;
    LED <= data_bus;
    
    -- Bus selection
    with enable select data_bus <=
        reg_o when REG,
        alu_o when ALU;
    -- ALU enabling
    with enable select alu_e <=
        '1' when ALU,
        '0' when others;
    
    -- Working device memory
    working_memory : memory.registers
    port map(
        clk => system_clock,
        write => reg_write,
        addr => addr_bus,
        i => data_bus,
        o => reg_o
    );
    
    -- ALU
    main_alu : logic.alu
    port map(
        clk => system_clock,
        a => alu_a,
        b => alu_b,
        c => alu_c,
        e => alu_e,
        o => alu_o
    );

end Structural;
