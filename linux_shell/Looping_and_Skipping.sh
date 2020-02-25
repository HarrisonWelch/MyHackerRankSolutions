# https://www.hackerrank.com/challenges/bash-tutorials---looping-and-skipping/problem

n=0
for i in {1..99}
do
    n=$(($i % 2))
    if [ $n != 0 ]
    then
        echo "$i"
    fi
done
