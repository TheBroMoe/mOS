#include "../cpu/isr.h"
#include "../drivers/screen.h"
#include "kernel.h"
#include "../libc/string.h"
#include "../libc/mem.h"
#include <stdint.h>


void kernel_main() {
    isr_install();
    irq_install();

    kprint("Welcome to mOS!\n");
    kprint("Type something, it will ECHO in the Kernel\n"
        "END: Stop the CPU\nPAGE: request a kmalloc()\n> ");
}

void user_input(char *input) {
    if (strcmp(input, "END") == 0) {
        kprint("Stopping the CPU. Thank you for using mOS!\n");
        asm volatile("hlt");
    } else if (strcmp(input, "PAGE") == 0) {
        uint32_t phys_addr;
        uint32_t page = kmalloc(1000, 1, &phys_addr);
        char page_str[16] = "";
        hex_to_ascii(page, page_str);
        char phys_str[16] = "";
        hex_to_ascii(phys_addr, phys_str);
        kprint("Page: ");
        kprint(page_str);
        kprint(", physical address: ");
        kprint(phys_str);
        kprint("\n");
    }
    kprint("ECHO: ");
    kprint(input);
    kprint("\n> ");
}
