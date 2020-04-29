arr=($(cat))

numLines=${#arr[@]}

# echo ${#arr[@]}
echo $numLines

sum=0

for t in "${arr[@]}"
    do
    sum+=($t)
    done

avg=$sum/$numLines

# paste -sd "+" | bc -l
echo $avg
