# itertools.combinations_with_replacement().py

# This tool returns  length subsequences of elements from the input 
# iterable allowing individual elements to be repeated more than once.

# Combinations are emitted in lexicographic sorted order. So, if the 
# input iterable is sorted, the combination tuples will be produced in 
# sorted order.

from itertools import combinations_with_replacement

if __name__ == '__main__':
  inp = input()
  S, k = inp.split(' ')
  # print('S = ' + str(S))
  k = int(k)
  S = list(S)
  # print('S = ' + str(S))
  S.sort()
  # print('S = ' + str(S))
  # print('k = ' + str(k))ptyt
  res = list(combinations_with_replacement(S, k))
  # print(res)
  arr = []
  for i in range(len(res)):
    b = ''
    for j in range(len(res[i])):
      b = b + res[i][j]
    arr.append(b)
  # # arr.sort()
  for i in range(len(arr)):
    print(arr[i])