# Makefile for MPU
#
# Author: J. L. Hay


SRC_DIR = src
TEST_DIR = test
BUILD_DIR = build

DESIGN_FILES = $(wildcard $(SRC_DIR)/**.vhd)
TEST_FILES = $(wildcard $(TEST_DIR)/**_tb.vhd)

VHDL = ghdl
VHDL_FLAGS = --std=93c --ieee=standard --workdir=$(BUILD_DIR)


$(BUILD_DIR)/%.vhd: $(SRC_DIR)/%.vhd import | $(BUILD_DIR)
	$(VHDL) -s $(VHDL_FLAGS) $<
	$(VHDL) -m $(VHDL_FLAGS) $(notdir $(basename $@))


$(BUILD_DIR)/%.ghw: $(TEST_DIR)/%_tb.vhd $(SRC_DIR)/%.vhd | $(BUILD_DIR)
	$(VHDL) -s $(VHDL_FLAGS) $<
	$(VHDL) -r --wave=$@ $<  


$(BUILD_DIR): 
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/work-obj93.cf: $(DESIGN_FILES) | $(BUILD_DIR)
	$(VHDL) -i $(VHDL_FLAGS) $^


.PHONY: verify
verify: $(DESIGN_FILES) $(TEST_FILES)
	$(VHDL) -s $(VHDL_FLAGS) $^

.PHONY: import
import: $(BUILD_DIR)/work-obj93.cf

.PHONY: clean
clean: 
	rm -rf $(BUILD_DIR)