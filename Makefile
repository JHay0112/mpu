# Makefile for MPU
#
# Author: J. L. Hay


SRC_DIR = src
TEST_DIR = test
BUILD_DIR = build

DESIGN_FILES = $(shell find $(SRC_DIR) -name "*.vhd")
TEST_FILES = $(shell find $(TEST_DIR) -name "*_tb.vhd")
IMPORT_FILE = $(BUILD_DIR)/work-obj93.cf

VHDL = ghdl
VHDL_FLAGS = --std=93c --ieee=standard --workdir=$(BUILD_DIR)


$(BUILD_DIR)/%.vhd: $(SRC_DIR)/%.vhd $(IMPORT_FILE) | $(BUILD_DIR) 
	$(VHDL) -s $(VHDL_FLAGS) $<
	$(VHDL) -m $(VHDL_FLAGS) $(notdir $(basename $@))


$(BUILD_DIR)/%_tb.ghw: $(TEST_DIR)/%_tb.vhd $(SRC_DIR)/%.vhd $(IMPORT_FILE) | $(BUILD_DIR)
	$(VHDL) -s $(VHDL_FLAGS) $<
	$(VHDL) -m $(VHDL_FLAGS) $(notdir $(basename $<)) 
	$(VHDL) -r $(VHDL_FLAGS) $(notdir $(basename $<)) --wave=$@
	touch $(basename $@).log


$(BUILD_DIR): 
	mkdir -p $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)/memory
	mkdir -p $(BUILD_DIR)/logic

$(IMPORT_FILE): $(DESIGN_FILES) $(TEST_FILES) | $(BUILD_DIR)
	$(VHDL) -i $(VHDL_FLAGS) $^


.PHONY: verify
verify: $(DESIGN_FILES) $(TEST_FILES) $(IMPORT_FILE) | $(BUILD_DIR)
	$(VHDL) -s $(VHDL_FLAGS) $(DESIGN_FILES) $(TEST_FILES) 

.PHONY: clean
clean: 
	rm -rf $(BUILD_DIR)