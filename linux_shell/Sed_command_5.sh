# https://www.hackerrank.com/challenges/sed-command-5/problem

# awk '{ print $4,$3,$2,$1 }' | sed -e 's/   //g'

sed -r 's/(.... )(.... )(.... )(....)/\4 \3\2\1/'
