findfiles = $(foreach ext, c cpp, $(wildcard $(1)/*.$(ext)))
getobjs = $(foreach ext, c cpp m mm x xm xi xmi, $(filter %.o,$(patsubst %.$(ext),%.o,$(1))))

OPENCV_CDFLAGS = `pkg-config --cflags opencv`
OPENCV_LDFLAGS = -L/usr/lib/x86_64-linux-gnu/ `pkg-config --libs opencv`
#-stdlib=libc++
# -fopenmp

TEST_FILES = $(call findfiles,sources)
TEST_CFLAGS = $(OPENCV_CFLAGS) -c -Wall -O3 -I ../shared
TEST_LDFLAGS = $(OPENCV_LDFLAGS)

CC := clang++
OBJ_DIR := .objs
OBJECTS = $(patsubst %,$(OBJ_DIR)/%,$(call getobjs, $(TEST_FILES)))
EXECUTABLE := exe

all: $(TEST_FILES) $(EXECUTABLE)

$(OBJECTS): | $(OBJ_DIR)

$(OBJ_DIR):
	@mkdir -p $@

$(OBJ_DIR)/%.o: %.c
	@mkdir -p `dirname $@`
	@echo ":: $< => $@"
	$(CC) $(DIP_CFLAGS) -x c $< -o $@

$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p `dirname $@`
	@echo ":: $< => $@"
	$(CC) $(DIP_CFLAGS) $< -o $@

$(EXECUTABLE): $(OBJECTS)
	@echo ":: $^ => $@"
	$(CC) $^ -o $@ $(DIP_LDFLAGS)

test: $(EXECUTABLE)
	@./$(EXECUTABLE)

clean:
	rm -rf $(OBJ_DIR) $(EXECUTABLE)
