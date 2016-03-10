findfiles = $(foreach ext, c cpp m mm x xm xi xmi, $(wildcard $(1)/*.$(ext)))
getobjs = $(foreach ext, c cpp m mm x xm xi xmi, $(filter %.o,$(patsubst %.$(ext),%.o,$(1))))

OPENCV_CDFLAGS = `pkg-config --cflags opencv`
OPENCV_LDFLAGS = -L/usr/lib/x86_64-linux-gnu/ `pkg-config --libs opencv`
#-stdlib=libc++
# -fopenmp

TOOL_NAME = TEST
TEST_FILES = $(call findfiles,sources)
TEST_CFLAGS = #$(OPENCV_CFLAGS)
TEST_LDFLAGS = #$(OPENCV_LDFLAGS)

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tool.mk

test: $(TOOL_NAME)
	@file $(THEOS_OBJ_DIR)/$(TOOL_NAME)
