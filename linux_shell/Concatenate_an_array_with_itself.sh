# https://www.hackerrank.com/challenges/bash-tutorials-concatenate-an-array-with-itself/problem

#!/bin/bash

filecontent=( `cat "/dev/stdin" ` )

array=()

for t in "${filecontent[@]}"
    do
    array+=($t)
    done

tripleArray=( "${array[@]}" "${array[@]}" "${array[@]}")

echo ${tripleArray[@]}
