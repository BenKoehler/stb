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
stbtruetype_impl.cpp \
-c

emar rcs libstb_truetype.bc \
stbtruetype_impl.o \

rm stbtruetype_impl.o

