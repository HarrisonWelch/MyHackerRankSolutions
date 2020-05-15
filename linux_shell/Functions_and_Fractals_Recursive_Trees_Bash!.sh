#!/bin/bash

# Y-fractal
# 0 iteration(s) |  0 stem |  0 branches
# 1 iteration(s) | 16 stem | 16 branches
# 2 iteration(s) |  8 stem |  8 branches
# 3 iteration(s) |  4 stem |  4 branches
# 4 iteration(s) |  2 stem |  2 branches
# 5 iteration(s) |  1 stem |  1 branches

read iter

# if 0, leave program
if [[ $iter -eq '0' ]]
    then
    exit
fi

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
    spos=$(($widthMap + 2)) # add 2 b/c of newlines - 65
    spos=$(($spos * $2)) # mul by how far down we are (y axis) - y * 65
    spos=$(($spos - $widthMap)) # (y*65) - 65
    spos=$(($spos + $1)) # (y*65) - 65 + x
    spos=$(($spos - 2)) # (y*65) - 65 + x - 2
    ret_spos=$(($spos))
    return $((ret_spos))
}

string_index_to_xy_coords () {
    local x=0
    local y=0
    x=$(($widthMap+2))
    x=$(($1%$x))
    y=$widthMap
    y=$(($1/$y))
    ret_arr=("$x" "$y")
    return 0
}

change_at_x_y_to_1 () {
    local spos=0
    xy_coords_to_string_index $1 $2
    map="${map:0:$ret_spos}1${map:$ret_spos+1}"
}

change_at_x_y_to_2 () {
    local spos=0
    xy_coords_to_string_index $1 $2
    map="${map:0:$ret_spos}2${map:$ret_spos+1}"
}

# DRAW MAP
for (( i=$one; i<=$heightMap; i++ ))
do
    for (( j=$one; j<=$widthMap; j++ ))
    do
        map+="_"
    done
    map+="\n"
done

# put start pos in the spos array
xy_coords_to_string_index ${start_pos_xy[0]} ${start_pos_xy[1]}
spos_arr+=( "$ret_spos" )

stick_length=16

loop_arr=($spos_arr)

for (( i=$one; i<=$iter; i++ )); do
    echo looping over spos_arr = ${spos_arr[@]}
    for j in ${spos_arr[@]} 
    do
        string_index_to_xy_coords $j # sets ret_arr

        # MIDDLE STEM
        start_x="${ret_arr[0]}"
        start_y="${ret_arr[1]}"
        # draw
        for k in $(seq 1 $stick_length)
        do
            change_at_x_y_to_1 $start_x $start_y
            # Y going up
            start_y=$(($start_y-1))
        done

        # LEFT LINE
        start_x="${ret_arr[0]}"
        start_x=$(($start_x-1))
        # y will remain the same from the previous loop
        # draw
        for k in $(seq 1 $stick_length)
        do
            change_at_x_y_to_1 $start_x $start_y
            start_y=$(($start_y-1))
            start_x=$(($start_x-1))
        done

        # PLACE LEFT INDEX OF NEXT Y IN ARRAY
        # xy_coords_to_string_index $(($start_x+1)) $(($start_y+1)) # sets ret_spos
        xy_coords_to_string_index $(($start_x+1)) $(($start_y+1)) # sets ret_spos
        spos_arr+=( "$ret_spos" )

        # RIGHT LINE
        # Set up Indexes
        start_x="${ret_arr[0]}"
        start_x=$(($start_x+1))
        start_y="${ret_arr[1]}"
        start_y=$(($start_y-$stick_length))
        # draw
        for k in $(seq 1 $stick_length)
        do
            change_at_x_y_to_1 $start_x $start_y
            start_y=$(($start_y-1))
            start_x=$(($start_x+1))
        done
        
        # PLACE RIGHT INDEX OF NEXT Y IN ARRAY
        # xy_coords_to_string_index $(($start_x-1)) $(($start_y+1))
        xy_coords_to_string_index $(($start_x-1)) $(($start_y))
        spos_arr+=( "$ret_spos" ) # use '+=' to add it
        
    done

    # Cut the length in half (16->8)
    stick_length=$(($stick_length/2))

    # remove the positions for Ys that have been drawn
    start_remove_index=$(($i-1))
    start_remove_index=$((2**$start_remove_index))
    spos_arr=( "${spos_arr[@]:$start_remove_index}" )

    
    # echo next loop spos_arr ${spos_arr[*]}
done

# echo -e $map
# string_index_to_xy_coords 3094
# change_at_x_y_to_2 ${ret_arr[0]} ${ret_arr[1]}

# string_index_to_xy_coords 1572
# change_at_x_y_to_2 ${ret_arr[0]} ${ret_arr[1]}

# string_index_to_xy_coords 1690
# change_at_x_y_to_2 ${ret_arr[0]} ${ret_arr[1]}

# string_index_to_xy_coords 1706
# change_at_x_y_to_2 ${ret_arr[0]} ${ret_arr[1]}

# string_index_to_xy_coords 3196
# change_at_x_y_to_2 ${ret_arr[0]} ${ret_arr[1]}

# string_index_to_xy_coords 3228
# change_at_x_y_to_2 ${ret_arr[0]} ${ret_arr[1]}

# string_index_to_xy_coords 3094
# change_at_x_y_to_2 ${ret_arr[0]} ${ret_arr[1]}
# string_index_to_xy_coords 3126
# change_at_x_y_to_2 ${ret_arr[0]} ${ret_arr[1]}

echo -e $map
