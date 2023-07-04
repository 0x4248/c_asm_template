# C ASM Template (Makefile)
# Github: https://www.github.com/lewisevans2007/c_asm_template
# Licence: GNU General Public License v3.0
# By: Lewis Evans

TARGET = program

include config.mk

CFLAGS = -I include

OBJDIR = obj
SRCDIR = src

C_SOURCES = $(wildcard $(SRCDIR)/*.c)
ASM_SOURCES = $(wildcard arch/$(ARCH)/*.asm)

C_OBJECTS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(C_SOURCES))
ASM_OBJECTS = $(patsubst arch/$(ARCH)/%.asm,$(OBJDIR)/%.o,$(ASM_SOURCES))

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(ASM_OBJECTS) $(C_OBJECTS)
	$(CC) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJDIR)/%.o: arch/$(ARCH)/%.asm | $(OBJDIR)
	$(AS) -o $@ $<

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf $(OBJDIR) $(TARGET)

help:
	@echo "make        - build the program"
	@echo "make clean  - remove all build files"
	@echo "make help   - show this help message"