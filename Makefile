findfiles = $(foreach ext, c cpp m mm x xm xi xmi, $(wildcard $(1)/*.$(ext)))
getobjs = $(foreach ext, c cpp m mm x xm xi xmi, $(filter %.o,$(patsubst %.$(ext),%.o,$(1))))

TOOL_NAME = TEST
TEST_FILES = $(call findfiles,sources)

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tool.mk

test: $(TOOL_NAME)
	@file $(THEOS_OBJ_DIR)/$(TOOL_NAME)
	@$(THEOS_OBJ_DIR)/$(TOOL_NAME)
