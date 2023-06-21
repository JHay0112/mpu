-- Instruction set
-- Produces 16-bit instruction words from functions.
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;
use work.memory.all;
use work.logic.all;

package instructions is

    -- Instruction configuration
    constant INSTRUCTION_LENGTH : integer := 16;
    subtype instruction is std_logic_vector(INSTRUCTION_LENGTH-1 downto 0);
    
    -- Instruction sub-types (codes)
    constant CODE_LENGTH : integer := 2;
    type code is (
        LOAD, -- Load a register with a constant value
        MOVE, -- Move data between registers
        PROC, -- Perform a procedure on registers
        JUMP  -- Move elsewhere in code
    );
    
    -- Register type
    subtype reg is integer range NUM_REGISTERS-1 downto 0;
   

end package;