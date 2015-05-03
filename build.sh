#!/bin/sh
DIR="$( dirname "${BASH_SOURCE[0]}" )"
cd $DIR
echo "INFO Working dir set to $(pwd)"
echo "INFO Transpiling ATS2 to C"
patscc src/main.dats -ccats
echo "INFO Compiling C to binary executable"
PATH=vendor/tcc:$PATH
tcc.exe -Ivendor/ats2 -Ivendor/ats2/runtime -Ivendor/tcc/include -o out.exe main_dats.c
echo "INFO Launching"
echo ""
./out.exe
echo ""
