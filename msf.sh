#!/bin/bash
# makefish.sh

# install packages if not already installed
unzip -v &> /dev/null || pacman -S --noconfirm unzip
make -v &> /dev/null || pacman -S --noconfirm make
g++ -v &> /dev/null || pacman -S --noconfirm mingw-w64-x86_64-gcc

# download the Stockfish source code
wget https://github.com/ddugovic/Stockfish/archive/master.zip
unzip master.zip
cd Stockfish-master/src

# build the stockfish executable
# to speedup the building process you can keep only the section that fits your CPU architecture

# build the binary for CPUs without popcnt and bmi2 instructions (e.g. older than Intel Sandy Bridge)
make profile-build ARCH=x86-64 COMP=mingw
strip stockfish.exe
mv stockfish.exe ../../stockfish_x64.exe
make clean

# build the binary for CPU with popcnt instruction (e.g. Intel Sandy Bridge)
if [ "$(g++ -Q -march=native --help=target | grep mpopcnt | grep enabled)" ] ; then
  make profile-build ARCH=x86-64-modern COMP=mingw
  strip stockfish.exe
  mv stockfish.exe ../../stockfish_x64_modern.exe
  make clean
fi

# build the binary for CPU with bmi2 instruction (e.g. Intel Haswell or newer)
if [ "$(g++ -Q -march=native --help=target | grep mbmi2 | grep enabled)" ] ; then
  make profile-build ARCH=x86-64-bmi2 COMP=mingw
  strip stockfish.exe
  mv stockfish.exe ../../stockfish_x64_bmi2.exe
  make clean
fi

cd
