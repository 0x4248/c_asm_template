# C ASM Template (Makefile)
# Github: https://www.github.com/awesomelewis2007/c_asm_template

ARCH = x86_64

AS = as
CC = gcc

SRC = src
MAIN = main.c

ARCH_FOLDER = arch
STARTUP = startup.asm

OUTPUT = main
MAIN_OUTPUT = main.o
STARTUP_OUTPUT = startup.o

all: $(MAIN_OUTPUT) $(STARTUP_OUTPUT)
	$(CC) $(MAIN_OUTPUT) $(STARTUP_OUTPUT) -o $(OUTPUT)

$(MAIN_OUTPUT): $(SRC)/$(MAIN)
	$(CC) -c $(SRC)/$(MAIN) -o $(MAIN_OUTPUT)

$(STARTUP_OUTPUT): $(ARCH_FOLDER)/$(ARCH)/$(STARTUP)
	$(AS) $(ARCH_FOLDER)/$(ARCH)/$(STARTUP) -o $(STARTUP_OUTPUT)

clean:
	rm -f $(MAIN_OUTPUT) $(STARTUP_OUTPUT) $(OUTPUT)