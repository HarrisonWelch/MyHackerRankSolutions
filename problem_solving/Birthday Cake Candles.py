#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the birthdayCakeCandles function below.
def birthdayCakeCandles(ar):

    tallest_candle = ar[0]
    num_tallest = 1
        
    for i in range(1,len(ar)):
        if tallest_candle == ar[i]:
            num_tallest = num_tallest + 1
        elif tallest_candle < ar[i]:
            tallest_candle = ar[i]
            num_tallest = 1
        
    return num_tallest;

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    ar_count = int(input())

    ar = list(map(int, input().rstrip().split()))

    result = birthdayCakeCandles(ar)

    fptr.write(str(result) + '\n')

    fptr.close()
