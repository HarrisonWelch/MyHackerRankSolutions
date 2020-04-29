# https://www.hackerrank.com/challenges/bash-tutorials-display-the-third-element-of-an-array/problem

#!/bin/bash

filecontent=( `cat "/dev/stdin" ` )

array=()

for t in "${filecontent[@]}"
    do
    array+=($t)
    done

echo ${array[3]}
