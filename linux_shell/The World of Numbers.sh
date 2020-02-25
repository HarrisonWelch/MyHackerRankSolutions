# https://www.hackerrank.com/challenges/bash-tutorials---the-world-of-numbers/problem

read x
read y

sum=$((x+y))
sub=$((x-y))
mul=$((x*y))
div=$((x/y))

echo "$sum"
echo "$sub"
echo "$mul"
echo "$div"
