#!/bin/bash
em++ \
\
-I. \
-I/usr/lib/emscripten/system/include \
\
-std=c++20 \
-O3 \
-flto \
\
stbimage_impl.cpp \
-c

emar rcs libstb_image.bc \
stbimage_impl.o \

rm stbimage_impl.o

