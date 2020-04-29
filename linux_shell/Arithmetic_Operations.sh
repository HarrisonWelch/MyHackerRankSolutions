# https://www.hackerrank.com/challenges/bash-tutorials---arithmetic-operations/problem

arr=($(cat))

numLines=${#arr[@]}
# one=1
numLines=$(($numLines - 1))

# echo ${#arr[@]}
# echo $numLines

sum=0

for t in "${arr[@]}"
    do
    # sum=$(($sum + $t))
    # echo $t
    sum=$(($sum + $t))
    done

# echo $(($sum/$numLines))

sum=$(($sum - $numLines))

# echo $sum

echo "scale=50 ; $sum/$numLines" | bc -l | xargs printf "%.3f"

# paste -sd "+" | bc -l
# echo $avg
