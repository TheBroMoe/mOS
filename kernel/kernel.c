#include "../cpu/isr.h"
#include "../drivers/screen.h"
#include "kernel.h"
#include "../libc/string.h"


void main() {
    isr_install();
    irq_install();

    kprint("Type somethig, the kernel will ECHO what you write\n"
        "Type END to stop the CPU\n> ");

}

void user_input(char *input){
    if (strcmp(input, "END") == 0){
        kprint("Stopping the CPU. Bye!\n");
        asm volatile("hlt");
    }
    kprint("You Entered: ");
    kprint(input);
    kprint("\n> ");
}