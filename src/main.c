/**
 * C ASM Template (main.c)
 * Github: https://www.github.com/awesomelewis2007/c_asm_template
 * 
 * Main C file. This file is compiled into an object file and
 * linked with the assembly entry point. The assembly entry
 * point will call the program function and return the value
 * to the operating system.
*/

#include <stdio.h>

/**
 * program - the main c function
 * 
 * This function is called by the assembly entry 
 * point. The return value is passed back to the 
 * assembly entry point. The assembly entry point 
 * will return the value to the operating system.
*/
int program() {
    printf("Hello World!\n");
    return 0;
}
