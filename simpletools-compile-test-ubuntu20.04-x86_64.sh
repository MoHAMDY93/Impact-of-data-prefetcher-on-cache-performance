#!/bin/bash
set -ex
pre_install(){
	sudo apt install -y bison flex gzip gcc-multilib libz1 libncurses5 libbz2-1.0 make
	sudo apt install gcc-multilib g++-multilib flex -y
	sudo apt install build-essential -y
}

export HOST=i386-redhat-linux        
export TARGET=sslittle-na-sstrix       
export IDIR=`pwd`

simpltools_sslittle-na-sstrix_compile(){
	tar xf simpletools-sslittle-na-sstrix-m.tgz
}
simpleutils_compile(){
	tar xf simpleutils-990811-m.tar.gz
	pushd simpleutils-990811
	CC="gcc -m32" ./configure --host=$HOST --target=$TARGET --with-gnu-as --with-gnu-ld --prefix=$IDIR
	make -j10
	make install
	popd
}
gcc_compile(){
	tar xf gcc-2.7.2.3.ss-m.tar.gz
	pushd gcc-2.7.2.3
        make clean
	CC="gcc -m32" ./configure --host=$HOST --target=$TARGET --with-gnu-as --with-gnu-ld --prefix=$IDIR
	make LANGUAGES="c c++" CFLAGS="-O" CC="gcc -m32" -j10
	make install LANGUAGES="c c++" CFLAGS="-O" CC="gcc -m32"
	popd
}
gcc_test(){
	pushd bin
	./sslittle-na-sstrix-gcc ../hello.c -o hello
        popd
}
simpletools_tar(){
 	mkdir sslittle_tools
	cp -ar bin include info man sslittle-na-sstrix lib share sslittle_tools
	tar czf sslittle_tools.tar.gz sslittle_tools
}
simplesim_compile(){
	tar xf simplesim-3v0e.tgz
	pushd simplesim-3.0
 	make config-pisa
	make
        popd
}
simplesim_test(){
        pushd simplesim-3.0
	./sim-safe tests/bin.little/test-math    
	./sim-outorder tests/bin.little/test-math 
	./sim-safe ../sslittle_tools/bin/hello 
        popd
}
pre_install
simpltools_sslittle-na-sstrix_compile
simpleutils_compile
gcc_compile
gcc_test
simpletools_tar
simplesim_compile
simplesim_test
