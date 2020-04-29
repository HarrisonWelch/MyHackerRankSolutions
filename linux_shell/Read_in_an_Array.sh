# https://www.hackerrank.com/challenges/bash-tutorials-read-in-an-array/problem

#!/bin/bash

filecontent=( `cat "/dev/stdin" ` )

array=()

for t in "${filecontent[@]}"
    do
    array+=($t)
    done

echo ${array[@]}
