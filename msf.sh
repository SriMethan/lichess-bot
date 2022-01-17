#!/bin/bash

unzip -v &> /dev/null || apt install -y unzip
make -v &> /dev/null || apt install -y make
g++ -v &> /dev/null || apt install -y build-essential


wget https://github.com/ddugovic/Stockfish/archive/master.zip
unzip master.zip
cd Stockfish-master/src

if [ "$(g++ -Q -march=native --help=target | grep mpopcnt | grep enabled)" ] ; then
  make profile-build ARCH=x86-64-modern COMP=gcc
  strip stockfish
  mv stockfish ../../stockfish_x64_modern
  make clean
fi

cd
