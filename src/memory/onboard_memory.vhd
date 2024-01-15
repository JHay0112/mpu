-- Memory implemented in the FPGA. 
-- This would typically be data intended to be accessed very quickly. For large sets of data
-- consider accessing off-chip memory through some interface to save logic cells on the FPGA.
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.config.all;


entity onboard_memory is 
    generic(
        WORD_LEN : integer;
        ADDR_LEN : integer
    );
    port(
        clk : in std_logic;
        en : in std_logic;
        addr : in std_logic_vector(ADDR_LEN-1 downto 0);
        d_in : in std_logic_vector(WORD_LEN-1 downto 0);
        d_out : out std_logic_vector(WORD_LEN-1 downto 0) := (others => 'Z');
        rw : in std_logic
    );
end entity onboard_memory;


architecture behavioural of onboard_memory is 

    signal memory : std_logic_vector(BYTE_LEN*(ADDR_LEN*ADDR_LEN) + WORD_LEN downto 0) := (others => '0');

begin

    main : process(clk) is
        variable upper_bound : integer;
        variable lower_bound : integer;
    begin
        if rising_edge(clk) then

            d_out <= (others => 'Z');

            if (en = '1') then
                if (rw = '1') then
                    memory(to_integer(unsigned(addr))*BYTE_LEN + WORD_LEN - 1 downto to_integer(unsigned(addr)) * BYTE_LEN) <= d_in;
                else
                    d_out <= memory(to_integer(unsigned(addr))*BYTE_LEN + WORD_LEN - 1 downto to_integer(unsigned(addr)) * BYTE_LEN);
                end if;
            end if;

        end if;
    end process;

end architecture behavioural;