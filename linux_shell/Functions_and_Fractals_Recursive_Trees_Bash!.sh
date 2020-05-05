#!/bin/bash

# Y-fractal
# Input = 0 | 0 length stem/branch
# Input = 1 | 16 length stem/branch
# Input = 2 | 8 length stem/branch
# Input = 3 | 4 length stem/branch
# Input = 4 | 2 length stem/branch
# Input = 5 | 1 length stem/branch

read iter

# if 0, leave program
if [[ $iter -eq '0' ]]
    then
    exit
fi

# 0 iteration(s) |  0 stem |  0 branches
# 1 iteration(s) | 16 stem | 16 branches
# 2 iteration(s) |  8 stem |  8 branches
# 3 iteration(s) |  4 stem |  4 branches
# 4 iteration(s) |  2 stem |  2 branches
# 5 iteration(s) |  1 stem |  1 branches

map=''
one=1
widthMap=100
heightMap=63
start_pos_xy=(50 63)
spos_arr=()
ret_arr=(0 0)
ret_spos=0
pos=()
stem_size=0

xy_coords_to_string_index () {
    local spos=0
    spos=$(($widthMap + 2)) # add 2 b/c of newlines
    spos=$(($spos * $2)) # mul by how far down we are
    spos=$(($spos - $widthMap))
    spos=$(($spos + $1))
    spos=$(($spos - 2))
    # echo -e "xy spos = $spos \n"
    ret_spos=$(($spos))
    # sleep 1
    # echo "YEET"
    # sleep 1
    return $((ret_spos))
}

string_index_to_xy_coords () {
    local x=0
    local y=0
    x=$(($widthMap+2))
    # echo x1 $x
    x=$(($1%$x))
    # echo x2 $x
    y=$widthMap
    y=$(($1/$y))
    # y=$(($y - 2))
    ret_arr=("$x" "$y")
    return 0
}

change_at_x_y_to_1 () {
    local spos=0
    # echo "1 = $1"
    # echo "2 = $2"
    xy_coords_to_string_index $1 $2
    # xy_coords_to_string_index $1 $2
    # sleep 1
    # echo -e "chg spos = $spos \n"
    # echo "ret_spos = $ret_spos"
    map="${map:0:$ret_spos}1${map:$ret_spos+1}"
    # echo 
}

# var=
# pos+=

# draw map
for (( i=$one; i<=$heightMap; i++ ))
do
    # echo "YEET $i"
    for (( j=$one; j<=$widthMap; j++ ))
    do
        map+="_"
    done
    map+="\n"
done

# change_at_x_y_to_1 ${start_pos_xy[0]} ${start_pos_xy[1]}

# change_at_x_y_to_1 50 62
# change_at_x_y_to_1 50 61
# change_at_x_y_to_1 50 60

# put start pos in the spos array
xy_coords_to_string_index ${start_pos_xy[0]} ${start_pos_xy[1]}
spos_arr+=( "$ret_spos" )
# spos_arr+=( "$ret_spos" )

echo ${spos_arr[*]}

# stick_length=$((2**4))
# stick_length=$(($stick_length/$iter))
stick_length=16

echo stick_length $stick_length
loop_arr=($spos_arr)
# echo iter $iter
# loops=$((2**$iter))
# echo loops1 $loops
# loops=$(($loops-1)) # 2^n - 1
# echo loops2 $loops

for (( i=$one; i<=$iter; i++ )); do
    echo 'YEET'
    # spos_arr=$loop_arr
    for j in ${spos_arr[@]} 
    do
        # spos holds the positions with which to build Y's off of
        echo 'SKEET'
        
        # print y from pos
        echo $j
        string_index_to_xy_coords $j
        echo ${ret_arr[*]}

        # draw stem upwards
        start_y="${ret_arr[1]}"
        for k in $(seq 1 $stick_length)
        do
            change_at_x_y_to_1 ${ret_arr[0]} $start_y
            start_y=$(($start_y-1))
        done

        # draw the left stick
        start_x="${ret_arr[0]}"
        start_x=$(($start_x-1))
        for k in $(seq 1 $stick_length)
        do
            change_at_x_y_to_1 $start_x $start_y
            start_y=$(($start_y-1))
            start_x=$(($start_x-1))
        done

        # set up the xy pos if a new iteration of this loop is needed
        xy_coords_to_string_index $(($start_x+1)) $(($start_y+1))
        spos_arr+=( "$ret_spos" ) # use equal to overwrite it
        echo spos_arr1 ${spos_arr[*]}

        start_x="${ret_arr[0]}"
        start_x=$(($start_x+1))
        start_y="${ret_arr[1]}"
        start_y=$(($start_y-$stick_length))
        for k in $(seq 1 $stick_length)
        do
            change_at_x_y_to_1 $start_x $start_y
            start_y=$(($start_y-1))
            start_x=$(($start_x+1))
        done
        
        # set up the xy pos if a new iteration of this loop is needed
        xy_coords_to_string_index $start_x $start_y
        spos_arr+=( "$ret_spos" ) # use '+=' to add it

        echo spos_arr2 ${spos_arr[*]}
        
    done

    stick_length=$(($stick_length/2))
    # spos_arr=()
    start_remove_index=$(($i-1))
    start_remove_index=$((2**$start_remove_index))
    echo start_remove_index $start_remove_index
    spos_arr=( "${spos_arr[@]:$start_remove_index}" )
    echo spos_arr3 ${spos_arr[*]}
done

echo -e $map
