from __future__ import print_function

if __name__ == '__main__':
#     n = int(raw_input())
#     x = ""
#     for i in range(0,n):
#         x = x + str(i+1)
#     print(x)
    print(*range(1,int(raw_input())+1), sep='')
