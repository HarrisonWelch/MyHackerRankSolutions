# IN
# 5
# 0 0 1 2 1

# Expected OUT
# 2

read num
read line

echo $line | 
    tr " " "\n" | 
    sort | 
    uniq -c | 
    sed -e 's/......//g' | 
    awk '{ if ($1 == 1) print $2;}'
