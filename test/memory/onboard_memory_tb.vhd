-- Testbench for onboard memory module.
--
-- Author: J. L. Hay


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.config.all;


entity onboard_memory_tb is 
    --
end entity onboard_memory_tb;


architecture testbench of onboard_memory_tb is 

    constant WORD_LEN : integer := 4*BYTE_LEN;
    constant ADDR_LEN : integer := 4;

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

    constant ZEROS : std_logic_vector(WORD_LEN-1 downto 0) := (others => '0');
    constant ONES : std_logic_vector(WORD_LEN-1 downto 0) := (others => '1');

    signal clk : std_logic := '0';
    signal en : std_logic := '0';
    signal addr : std_logic_vector(ADDR_LEN-1 downto 0) := (others => '0');
    signal d_in : std_logic_vector(WORD_LEN-1 downto 0) := (others => '0');
    signal d_out : std_logic_vector(WORD_LEN-1 downto 0) := (others => '0');
    signal rw : std_logic := '0';

    signal run_tb : std_logic := '1';

begin

    dut : onboard_memory
        port map(
            clk => clk,
            en => en,
            addr => addr,
            d_in => d_in,
            d_out => d_out,
            rw => rw
        );

    clock : process is
        --
    begin
        while run_tb = '1' loop
            wait for CLOCK_PERIOD/2;
            clk <= not clk;
        end loop;

        wait;
    end process;

    test : process is
        --
    begin 
        report "Running testbench for memory/onboard_memory.vhd";

        assert d_out = ZEROS
            report "Default failed"
            severity error;

        wait for CLOCK_PERIOD/2;

        en <= '1';
        rw <= '1';
        d_in <= ONES;

        wait for CLOCK_PERIOD;

        rw <= '0';

        wait for CLOCK_PERIOD/2;

        assert d_out = ONES
            report "Write failed"
            severity error;

        wait for CLOCK_PERIOD/2;

        addr <= "0001";

        wait for CLOCK_PERIOD/2;

        assert d_out = x"00FFFFFF"
            report "Read failed"
            severity error;

        wait for CLOCK_PERIOD/2;
        report "Completed testbench simulation of memory/onboard_memory.vhd";
        run_tb <= '0';
        wait;
    end process;

end architecture testbench;