## Description:
This was a fun personal Project based on reading the OS-Dev [Document](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf) by Nick Blundell, as well as referring to the tutorial by [cfenollosa](https://github.com/cfenollosa/os-tutorial). I took on the task of trying to create my own OS to get more comfortable with low level computing, and fully grasp the concepts I was taught in my Operating Systems course.


## How to run:
1. run the script `./config.sh` to install dependencies
2. build a i686-elf cross compiler by running `./build_cross_compiler.sh`
if that doesn't work, you can follow the instructions given [here](https://wiki.osdev.org/GCC_Cross-Compiler#Preparing_for_the_build)
3. enter the command `source path.sh`. This will be a required step every time you create a new terminal process to run mOS, or alternatively you can save the $PATH in your .bashrc file
4. Compile and start mOS by running `./boot.sh` and the QEMU terminal will pop up as shown in the image below
Alternatively you can enter `make` to compile the program and `make run` to run the program. You can even run `make debug` to run mOS in debug mode which uses gdb.

<img src="https://github.com/TheBroMoe/mOS/blob/master/docs/images/mOS.png"></img>
## Currently Implemented:
* Created boot sector
* Can enter in 32-bit mode
* Kernel that echos users commands and can malloc physical memory
* Video Drivers
* Shell
* Interrupts
* memory allocation


## Features to add:
* File system
* Memory management
* Set up Network Protocols
* Security Protocols and Fault Tolerant design
* more function calls
