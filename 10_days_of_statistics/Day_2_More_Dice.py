
if __name__ == '__main__':
    size_of_dice = 6
    arr = []
    val6 = 0
    for i in range(1,size_of_dice+1):
        for j in range(1,size_of_dice+1):
            arr.append(i+j)
            if i != j and i+j == 6:
                val6 = val6 + 1
    arr.sort()

    print(arr)
    
    print(val6)
    print(len(arr))
    print(val6 / len(arr))
