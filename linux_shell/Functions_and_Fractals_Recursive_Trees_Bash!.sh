read iter

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
ret_arr=(0 0)
pos=()

xy_coords_to_string_index () {
    local spos=0
    spos=$(($widthMap + 2)) # add 2 b/c of newlines
    spos=$(($spos * $2)) # mul by how far down we are
    spos=$(($spos - $widthMap))
    spos=$(($spos + $1))
    return spos
}

string_index_to_xy_coords () {
    local x=0
    local y=0
    x= $1 % $(($widthMap+2))
    y= $1 / $(($widthMap+2))
    ret_arr=($x,$y)
    return 0
}

change_at_x_y_to_1 () {
    local spos=0
    echo "1 = $1"
    echo "2 = $2"
    spos = xy_coords_to_string_index $1 $2
    echo "spos = $spos"
    map="$(map:0:$spos)1$(map:$spos+1)"
    # echo 
}

var=
pos+=

for i in {1..63};do
    # echo "YEET"
    for j in {1..100}; do
        map+="_"
    done
    map+="\n"
done

change_at_x_y_to_1 ${start_pos_xy[0]} ${start_pos_xy[1]}

echo -e $map
