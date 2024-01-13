-- Data Memory 
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;


entity data_memory is 
    generic(
        WORD_LEN : integer;
        ADDR_LEN : integer
    );
    port(
        clk : in std_logic;
        addr : in std_logic_vector(ADDR_LEN-1 downto 0);
        d_in : in std_logic_vector(WORD_LEN-1 downto 0);
        d_out : out std_logic_vector(WORD_LEN-1 downto 0);
        rw : in std_logic
    );
end entity data_memory;


architecture architectural of data_memory is 

    component onboard_memory is 
        generic(
            WORD_LEN : integer := WORD_LEN;
            ADDR_LEN : integer := ADDR_LEN
        );
        port(
            clk : in std_logic;
            en : in std_logic;
            addr : in std_logic_vector(ADDR_LEN-1 downto 0);
            d_in : in std_logic_vector(WORD_LEN-1 downto 0);
            d_out : out std_logic_vector(WORD_LEN-1 downto 0);
            rw : in std_logic
        );
    end component onboard_memory;

begin

    data_mem: onboard_memory 
        port map(
            clk => clk,
            en => '1',
            addr => addr,
            d_in => d_in,
            d_out => d_out,
            rw => rw
        );

end architecture architectural;