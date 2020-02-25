# https://www.hackerrank.com/challenges/bash-tutorials---getting-started-with-conditionals/problem

read input

if  [ $input == 'y' ] || [ $input == 'Y' ]
then
    echo "YES"
fi

if  [ $input == 'n' ] || [ $input == 'N' ]
then
    echo "NO"
fi
