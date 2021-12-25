CC = gcc
CFLAGS=-Iinclude
LDFLAGS = -L$(SUBDIR) -static
ARFLAGS = rcs
TARGET=libtool2.a

.PHONY: all

all: $(TARGET)

# The order of `-L` and `-l` option is important
# implicit rules: `$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LOADLIBES) $(LDLIBS) -o $@` see the topmost README.md
$(TARGET): src1.o
	$(AR) $(ARFLAGS) -o $@ $^

install:
	install $(TARGET) $(INSTALL_DIR)

clean:
	$(RM) program *.o *.a $(INSTALL_DIR)
