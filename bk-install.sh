#!/bin/bash
cd ..
#remove previous installation
rm -r stb-build
rm -r stb
mkdir stb-build
mkdir stb
cd stb-build
cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=../stb \
../stb-src
make -j 8
make install
cd ..
rm -r stb-build
cp stb-src/bk.cmake stb

