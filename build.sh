#!/bin/sh
cd "$(dirname $0)"
echo "INFO Working dir set to $(pwd)"
echo "INFO Transpiling ATS2 to C"
patscc hello.dats -ccats
echo "INFO Compiling C to binary executable"
PATH=./vendor/tcc:$PATH
tcc.exe -I./vendor/ats2 -I./vendor/ats2/runtime -I./vendor/tcc/include hello_dats.c
echo "INFO Launching"
echo ""
./hello_dats.exe
