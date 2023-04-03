# C ASM Template

This is a template for a C project that uses an assembly file for the startup code.

## Folder structure

The folder structure is as follows:

```
.
├── arch
│   ├── aarch64
│   │   └── startup.asm     <--- Assembly file for aarch64
│   └── x86_64
│       └── startup.asm     <--- Assembly file for x86_64    
├── Makefile
├── README.md
└── src
    └── main.c              <--- C file that contains the program function
```

## How it works

When the program is started the assembly file is executed first. Lets use the X86_64 assembly file as an example. The assembly file contains the following code:

```asm
.section .text

.globl main

.extern program

main:
    call program
    movl %eax, %ebx
    movl $60, %eax
    movl %ebx, %ebx
    syscall
```

Then the C file is compiled and linked with the assembly file. The C file contains the following code:

```c
#include <stdio.h>

int program() {
    printf("Hello World!\n");
    return 0;
}
```

When the C program returns the assembly file will call the exit syscall with the return value of the program function.

## How to build

### x86_64

You need to set the `ARCH` variable to `x86_64` and run `make`.

```makefile
ARCH = x86_64

AS = as
CC = gcc
```

> **Note:**
>
> If you are running on aarch64 you need to set the as and cc variables to the cross compiler.

```bash 
make
```


### aarch64

You need to set the `ARCH` variable to `aarch64` and run `make`.

```makefile
ARCH = aarch64

AS = as
CC = gcc
```

> **Note:**
>
> If you are running on aarch64 you need to set the as and cc variables to the cross compiler.

```bash
make
```

## How to run

To run the program you need to execute the following command:

```bash
./main
```

## How to clean

To clean the project you need to execute the following command:

```bash
make clean
```