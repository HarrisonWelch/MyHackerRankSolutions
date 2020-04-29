# https://www.hackerrank.com/challenges/awk-4/problem

awk '{ printf (NR%2==0) ? 
    $1 " " $2 " " $3 " " $4 "\n" : 
    $1 " " $2 " " $3 " " $4 ";" ]
}'
