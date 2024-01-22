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


    type instr_r is record 
        funct7 : std_logic_vector(6 downto 0);
        rs2 : std_logic_vector(4 downto 0);
        rs1: std_logic_vector(4 downto 0);
        funct3 : std_logic_vector(2 downto 0);
        rd : std_logic_vector(4 downto 0);
        opcode : std_logic_vector(OPCODE_LEN-1 downto 0);
    end record;

    type instr_i is record
        imm : std_logic_vector(11 downto 0);
        rs1 : std_logic_vector(4 downto 0);
        funct3 : std_logic_vector(2 downto 0);
        rd : std_logic_vector(4 downto 0);
        opcode : std_logic_vector(OPCODE_LEN-1 downto 0);
    end record;

    type instr_s is record
        imm : std_logic_vector(11 downto 0);
        rs2 : std_logic_vector(4 downto 0);
        rs1 : std_logic_vector(4 downto 0);
        funct3 : std_logic_vector(2 downto 0);
        opcode : std_logic_vector(OPCODE_LEN-1 downto 0);
    end record;

    type instr_u is record
        imm : std_logic_vector(19 downto 0);
        rd : std_logic_vector(4 downto 0);
        opcode : std_logic_vector(OPCODE_LEN-1 downto 0);
    end record;


    pure function decode_instr_r(instr : std_logic_vector(INSTR_WORD_LEN-1 downto 0)) return instr_r;
    pure function decode_instr_i(instr : std_logic_vector(INSTR_WORD_LEN-1 downto 0)) return instr_i;
    pure function decode_instr_s(instr : std_logic_vector(INSTR_WORD_LEN-1 downto 0)) return instr_s;
    pure function decode_instr_u(instr : std_logic_vector(INSTR_WORD_LEN-1 downto 0)) return instr_u;

end package;


package body instructions is

end package body;


