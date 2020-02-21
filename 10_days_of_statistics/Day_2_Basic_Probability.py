
if __name__ == '__main__':
    size_of_dice = 6
    arr = []
    for i in range(1,size_of_dice+1):
        for j in range(1,size_of_dice+1):
            arr.append(i+j)
    arr.sort()

    print(arr)
    
    above9 = 0
    for i in range(len(arr)):
        if arr[i] <= 9:
            above9 = above9 + 1
    print(above9)
    print(len(arr))
    print(above9 / len(arr))
