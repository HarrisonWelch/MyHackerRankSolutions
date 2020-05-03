#!/bin/bash

# Y-fractal
# Input = 0 | 0 length stem/branch
# Input = 1 | 16 length stem/branch
# Input = 2 | 8 length stem/branch
# Input = 3 | 4 length stem/branch
# Input = 4 | 2 length stem/branch
# Input = 5 | 1 length stem/branch

read iter

# Setup the map string
map=''
one=1
widthMap=63
heightMap=100

change_string_at_x_y_to_1 () {
    local spos=0
    spos=$(($widthMap+2))
    spos=$(($spos * $2))
    spos=$(($spos + $1))
    # echo -e ${map:$1:1}
    echo $spos
}

for (( i=$one; i<=$widthMap; i++ ))
do
    # echo "YEET $i"
    for (( j=$one; j<=$widthMap; j++ ))
    do
        map+="_"
    done
    map+="\n"
done

change_string_at_x_y_to_1 63 50

# echo -e $map
