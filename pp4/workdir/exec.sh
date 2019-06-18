./driver -d < $1 >${1%.*}.asm
#cat ../defs.asm >>${1%.*}.asm
spim -file ${1%.*}.asm
