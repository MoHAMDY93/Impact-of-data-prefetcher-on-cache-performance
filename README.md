# simplescalar-v3-ubuntu20.04
 simplescalar scripts and source code, as well as compiler tools that can be compile on ubuntu20.04


## Compilation environment description

Architecture: x86_64

System: Ubuntu 20.04.3 LTS \n \l

Disk space: tools and simulators are about 200MB

CPU: simplescalar itself is a single-threaded simulation, 1~2 is enough, more can speed up the compilation

Memory: Compilation requires 4-5G memory, actual running is no less than 500M


## Code packages 

├── gcc-2.7.2.3.ss-m.tar.gz

├── hello.c

├── simplesim-3v0e.tgz

├── simpletools-compile-test-ubuntu20.04-x86_64.sh

├── simpletools-sslittle-na-sstrix-m.tgz

└──simpleutils-990811-m.tar.gz



## Description：


simpletools-sslittle-na-sstrix-m.tgz ：Contains the includes files required by the compilation tool and libraries that are not easy to compile

sslittle-na-sstrix

├── include

└── lib


simpleutils-990811-m.tar.gz：Similar to the toolkit binutils, it contains the following tools

├── sslittle-na-sstrix-addr2line

├── sslittle-na-sstrix-ar

├── sslittle-na-sstrix-as

├── sslittle-na-sstrix-c++filt

├── sslittle-na-sstrix-gasp

├── sslittle-na-sstrix-ld

├── sslittle-na-sstrix-nm

├── sslittle-na-sstrix-objcopy

├── sslittle-na-sstrix-objdump

├── sslittle-na-sstrix-ranlib

├── sslittle-na-sstrix-readelf

├── sslittle-na-sstrix-size

├── sslittle-na-sstrix-strings

└── sslittle-na-sstrix-strip


gcc-2.7.2.3.ss-m.tar.gz：gcc and g++ tools for the pisa architecture

├── sslittle-na-sstrix-c++

├── sslittle-na-sstrix-g++

├── sslittle-na-sstrix-gcc

 
hello.c ：test program

simplesim-3v0e.tgz ：Source package for simplescalar

simpletools-compile-test-ubuntu20.04-x86_64.sh：Scripts for compiling and testing the pisa toolchain
