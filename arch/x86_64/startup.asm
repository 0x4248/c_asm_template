/**
 * C ASM Template (startup.asm) [X86_64]
 * Github: https://www.github.com/0x4248/c_asm_template
 * Licence: GNU General Public License v3.0
 * By: 0x4248
 *
 * Main Startup for x86_64 machines
 * This program calls the function program() 
 * and then exits with the return value
 */

.section .text

.globl main

.extern program

/**
 * Main startup code
 */
main:
    call program        /* Call the program function */
    movl %eax, %ebx     /* Move the return value to ebx */
    movl $60, %eax      /* Move the exit syscall number to eax */
    movl %ebx, %ebx     /* Move the return value to ebx */
    syscall             /* Call the exit syscall */
