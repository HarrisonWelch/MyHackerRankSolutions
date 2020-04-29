# https://www.hackerrank.com/challenges/bash-tutorials-slice-an-array/problem

#!/bin/bash

filecontent=( `cat "/dev/stdin" ` )

array=()

for t in "${filecontent[@]}"
    do
    array+=($t)
    done

echo ${array[@]:3:5}
