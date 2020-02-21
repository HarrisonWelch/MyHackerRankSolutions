
if __name__ == '__main__':

    # red then black
    urnX = (4, 3)
    urnY = (5, 4)
    urnZ = (4, 4)

    arrX = []
    arrY = []
    arrZ = []

    for i in range(urnX[0]):
        arrX.append('r')
    for i in range(urnX[1]):
        arrX.append('b')
    for i in range(urnY[0]):
        arrY.append('r')
    for i in range(urnY[1]):
        arrY.append('b')
    for i in range(urnZ[0]):
        arrZ.append('r')
    for i in range(urnZ[1]):
        arrZ.append('b')

    arr = []

    arrTemp = []
    for i in range(len(arrX)):
        for j in range(len(arrY)):
            for k in range(len(arrZ)):
                arrTemp = [arrX[i],arrY[j],arrZ[k]]
                arrTemp.sort()
                arr.append(arrTemp)
    # arr.sort()
    val_2r1b = 0
    for i in range(len(arr)):
        if arr[i] == ['b','r','r']:
            val_2r1b = val_2r1b + 1

    print(arr)
    print(val_2r1b)
    print(len(arr))
    print(val_2r1b / len(arr))

    # for i in range(len)

    # size_of_dice = 6
    # arr = []
    # val6 = 0
    # for i in range(1,size_of_dice+1):
    #     for j in range(1,size_of_dice+1):
    #         arr.append(i+j)
    #         if i != j and i+j == 6:
    #             val6 = val6 + 1
    # arr.sort()

    # print(arr)
    
    # print(val6)
    # print(len(arr)) 
    # print(val6 / len(arr))
