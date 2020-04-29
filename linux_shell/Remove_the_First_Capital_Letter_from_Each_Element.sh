# https://www.hackerrank.com/challenges/bash-tutorials-remove-the-first-capital-letter-from-each-array-element/problem

#!/bin/bash

filecontent=( `cat "/dev/stdin" ` )

array=()

for t in "${filecontent[@]}"
    do
    array+=($t)
    # echo $array[]
    done

char=''
allTogether=''

for i in "${array[@]}"
    do
    # echo ${array[$i]} | head -c 1
    # char=${array[$i]}# | head -c 1
    char=$i
    char="$(echo $char | head -c 1)"
    if [[ $char -eq "A" || 
          $char -eq "B" || 
          $char -eq "C" || 
          $char -eq "D" || 
          $char -eq "E" || 
          $char -eq "F" || 
          $char -eq "G" || 
          $char -eq "H" || 
          $char -eq "I" || 
          $char -eq "J" || 
          $char -eq "K" || 
          $char -eq "L" || 
          $char -eq "M" || 
          $char -eq "N" || 
          $char -eq "O" || 
          $char -eq "P" || 
          $char -eq "Q" || 
          $char -eq "R" || 
          $char -eq "S" || 
          $char -eq "T" || 
          $char -eq "U" || 
          $char -eq "V" || 
          $char -eq "W" || 
          $char -eq "X" || 
          $char -eq "Y" || 
          $char -eq "Z" ]]; then
        # echo "YEET"
        # array[$i]="YEET"
        # array[$i]="."
        char="$(echo $i | cut -c 2-)"
        # echo "char = $char"
        array[$i]=".$char"
        # array[$i]=".$char"
    fi
    # echo "${array[$i]}"
    allTogether+="${array[$i]} "
    # echo "$i"
    # echo $char
    done
# echo ${array[@]}
echo "$allTogether"


# for i in "${array[@]}"
#     do
#         echo $i
#     done
