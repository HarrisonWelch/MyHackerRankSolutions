# Find the Runner-Up Score!.py

# Given the participants' score sheet for your University Sports Day, you are required to find the runner-up score. You are given scores. Store them in a list and find the score of the runner-up.

if __name__ == '__main__':
    n = int(raw_input())
    arr = map(int, raw_input().split())
    
    arr.sort()
    
    # print arr
    
    for i in range(len(arr)-2,-1,-1):
        if arr[i] < arr[i+1]:
            print arr[i]
            break
