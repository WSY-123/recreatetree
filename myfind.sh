#!/bin/bash
if [ -z "$2" ] ;then
    grep -rn $1 --include *.c
    grep -rn $1 --include *.h
else
    grep -rn "$2" $1 --include *.c
    grep -rn "$2" $1 --include *.h
fi