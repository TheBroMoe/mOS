#!/bin/bash

install_package(){
    if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0];
    then
        echo "Installing $1..."
        sudo apt-get -y install $1 >/dev/null
    else
        echo "Package $1 already installed"
    fi
}

# Install packages

sudo apt update
install_package curl
install_package nasm
install_package qemu
install_package build-essential
install_package bison
install_package flex
install_package libgmp3-dev
install_package libmpc-dev
install_package libmpfr-dev
install_package texinfo
install_package libcloog-isl-dev
install_package libisl-dev
install_package libncurses5-dev

# Declare Variables and path
# ** Modify paths based on where you want compiler created and where your gcc is located **
export CC=/usr/bin/gcc
export LD=/usr/bin/gcc

export PREFIX="/usr/local/i686elfgcc"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

CROSS_DIR=$HOME/cross

# Download Source code
mkdir $CROSS_DIR
cd $CROSS_DIR

# binutils
wget -P $CROSS_DIR http://ftp.gnu.org/gnu/binutils/binutils-2.32.tar.gz
tar xf binutils-2.32.tar.gz
mkdir binutils-build
cd binutils-build
../binutils-2.24/configure --target=$TARGET --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=$PREFIX 2>&1 | tee configure.log
sudo make all install 2>&1 | tee make.log

# gcc
wget -P $CROSS_DIR https://ftp.gnu.org/gnu/gcc/gcc-9.1.0/gcc-9.1.0.tar.gz
tar xf gcc-9.1.0.tar.gz
mkdir gcc-build
cd gcc-build
../gcc-4.9.1/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
sudo make all-gcc 
sudo make all-target-libgcc 
sudo make install-gcc 
sudo make install-target-libgcc 

# gdb
wget -P $CROSS_DIR http://ftp.rediris.es/mirror/GNU/gdb/gdb-7.8.tar.gz
tar xf gdb-7.8.tar.gz
mkdir gdb-build
cd gdb-build
../gdb-7.8/configure --target="$TARGET" --prefix="$PREFIX" --program-prefix=i686-elf-
sudo make
sudo make install


