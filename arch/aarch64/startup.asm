/**
 * C ASM Template (startup.asm) [aarch64]
 * Github: https://www.github.com/0x4248/c_asm_template
 * Licence: GNU General Public License v3.0
 * By: 0x4248
 *
 * Main Startup for aarch64 machines
 * This program calls the function program() 
 * and then exits with the return value
 */

.extern program

.global main

/**
 * Main startup code
 */
main:
    mov x0, x0
    bl program  // call program
    mov x8, 93  // exit syscall
    svc 0       // call syscall
    