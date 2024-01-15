-- RISC-V 32I Instruction set
-- Adapted from https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf p. 104
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;


package instructions is

    -- Instructions are assumed to have a number of fields differing by type. All are expected to
    -- have a common opcode field at the end.
    constant OPCODE_LEN : integer := 7;

    type r is record 
        funct7 : std_logic_vector(6 downto 0);
        rs2 : std_logic_vector(4 downto 0);
        rs1: std_logic_vector(4 downto 0);
        funct3 : std_logic_vector(2 downto 0);
        rd : std_logic_vector(4 downto 0);
        opcode : std_logic_vector(OPCODE_LEN-1 downto 0);
    end record;

    type i is record
        imm : std_logic_vector(11 downto 0);
        rs1 : std_logic_vector(4 downto 0);
        funct3 : std_logic_vector(2 downto 0);
        rd : std_logic_vector(4 downto 0);
        opcode : std_logic_vector(OPCODE_LEN-1 downto 0);
    end record;

    type s is record
        imm : std_logic_vector(11 downto 0);
        rs2 : std_logic_vector(4 downto 0);
        rs1 : std_logic_vector(4 downto 0);
        funct3 : std_logic_vector(2 downto 0);
        opcode : std_logic_vector(OPCODE_LEN-1 downto 0);
    end record;

    type u is record
        imm : std_logic_vector(19 downto 0);
        rd : std_logic_vector(4 downto 0);
        opcode : std_logic_vector(OPCODE_LEN-1 downto 0);
    end record;

end package;


