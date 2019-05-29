# The sum tool returns the sum of array elements over a given axis.

import numpy

if __name__ == "__main__":
  
  inp = input()

  n,m = map(int, inp.split(' '))

  arr = []
  t_arr = []

  for i in range(n):
    t_arr = []
    inp = list(map(int, input().split(' ')))
    for j in range(m):
      t_arr.append(inp[j])
    arr.append(t_arr)

  # print(arr)

  arr = numpy.array(arr)

  # print(arr)

  s = numpy.prod(numpy.sum(arr, axis=0), axis=0)

  print(s)
