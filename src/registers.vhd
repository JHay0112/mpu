-- Device registers
-- This is based on the RAM module but entirely decoupled to
-- permit differing feature sets.
--
-- Generics:
--  W: The width of a memory word.
--  N: The number of words in the memory.
--  A: The width of the address bus.
--
-- Inputs:
--  clk: Clock signal.
--  addr: The address to access.
--  write: Whether to write to memory, else read.
--  i: Bus for incoming data.
--  o: Bus for outgoing data.
--
-- Author: J. L. Hay

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity registers is
    generic(
        W : integer;
        N : integer;
        A : integer
    );
    port(
        clk: in std_logic;
        addr : in std_logic_vector(A-1 downto 0);
        write : in std_logic;
        i : in std_logic_vector(W-1 downto 0);
        o : out std_logic_vector(W-1 downto 0)
    );
end registers;

architecture Behavioral of registers is

    -- Memory definitions
    type memory_t is array(N-1 downto 0) of std_logic_vector(W-1 downto 0);
    signal memory : memory_t := (others => (others => '0'));
    
begin

    -- Clock driven changes
    process(clk) is
    begin
        if (clk'event and clk = '1') then
            -- On rising clock edge
            if (write = '1') then
                -- Write mode
                memory(conv_integer(addr)) <= i;
            else
                -- Read mode
                o <= memory(conv_integer(addr));
            end if;
        end if;
    end process;
    
end Behavioral;
