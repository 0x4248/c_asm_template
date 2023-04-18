/**
 * C ASM Template (main.c)
 * Github: https://www.github.com/awesomelewis2007/c_asm_template
 * By: Lewis Evans
 * 
 * Main C file. This file is compiled into an object file and
 * linked with the assembly entry point. The assembly entry
 * point will call the program function and return the value
 * to the operating system.
 */

#include <stdio.h>
#include "add.h"

/**
 * program - the main c function
 *
 * This function is called by the assembly entry
 * point. The return value is passed back to the
 * assembly entry point. The assembly entry point
 * will return the value to the operating system.
 */
int program(int argc, char **argv)
{
    int a = 1;
    int b = 2;
    int c = add(a, b);
    printf("Hello World!\n");
    printf("argc: %d\n", argc);
    for (int i = 0; i < argc; i++)
    {
        printf("argv[%d]: %s\n", i, argv[i]);
    }
    printf("1 + 2 = %d\n", c);
    return 0;
}
