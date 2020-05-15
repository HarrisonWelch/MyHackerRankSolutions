#!/bin/bash

# Y-fractal
# 0 iteration(s) |  0 stem |  0 branches
# 1 iteration(s) | 16 stem | 16 branches
# 2 iteration(s) |  8 stem |  8 branches
# 3 iteration(s) |  4 stem |  4 branches
# 4 iteration(s) |  2 stem |  2 branches
# 5 iteration(s) |  1 stem |  1 branches

declare -A matrix
widthMap=100
heightMap=63

declare -a roots
roots[0]=50

# read the number of iterations
read iter

# start j from the bottom
j=63

# the 'Y' starts off at 16 and gets progressively cut in 
# half for each iteration down to 1 at minimum
stick_length=16

# ------------------
# BUILD BLANK MATRIX
# ------------------

for ((i=1;i<=heightMap;i++))
do
    for ((j=1;j<=widthMap;j++))
    do
        matrix[$i,$j]='_'
    done
done

# ---------------
# BUILD Y FRACTAL
# ---------------

for ((i=1; i<=iter; i++))
do
    # echo i $i YEET
    lim=$((${#roots[@]}-1)) #length of roots minus 1
    elems=${#roots[@]}
    old_j=$j
    for ((k=0; k<=lim; k++))
    do
        # echo k $k KEET
        pos=${roots[$k]}

        # middle stick
        for ((m=0; m<=stick_length-1; m++))
        do
            # echo m $m MEET1
            matrix[$(($j-38)),$pos]='1'
            ((j--))
        done
        
        # left and right stick
        for ((m=1; m<=stick_length; m++))
        do
            # echo m $m MEET2
            matrix[$(($j-38)),$((pos-m))]='1'
            matrix[$(($j-38)),$((pos+m))]='1'
            ((j--))
        done

        # add in roots
        roots=("${roots[@]}" "$((pos-m+1))" "$((pos+m-1))")

        if (( $k < $lim ))
        then
            j=$old_j
        fi
    done

    # actually remove elements
    for ((k=0; k<$elems; k++))
    do
        unset roots[$k]
    done
    roots=( "${roots[@]}" )
    stick_length=$((stick_length/2))
done

# ------------
# PRINT MATRIX
# ------------

for ((i=1;i<=heightMap;i++))
do
    for ((j=1;j<=widthMap;j++))
    do
        printf ${matrix[$i,$j]}
    done
    printf "\n"
done
