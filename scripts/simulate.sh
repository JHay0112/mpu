# Simulates DUT behaviour with the supplied testbench and displays waveforms.
# Intended to be run from the project's root directory. Accepts an argument with the testbench name
# and any subdirectories within the test/ directory. e.g.
#
# scripts/simulate.sh memory/onboard_memory_tb
#
# Author: J. L. Hay


make build/$1.ghw &&
gtkwave build/$1.ghw build/$1.sav