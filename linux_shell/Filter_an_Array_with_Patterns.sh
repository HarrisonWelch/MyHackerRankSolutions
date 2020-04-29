# https://www.hackerrank.com/challenges/bash-tutorials-filter-an-array-with-patterns/problem

# grep -iv a || true

arr=($(cat))
echo ${arr[@]/*[aA]*/}
