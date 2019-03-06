// Arrays Introduction

// An array is a series of elements of the same type placed in contiguous
// memory locations that can be individually referenced by adding 
// an index to a unique identifier.

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <string>

using namespace std;

int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
    int N = -1;
    cin >> N;
    int arr[N];
    string s = "";
    
    for (int i = 0; i < N; i++) {
        cin >> s;
        arr[i] = std::stoi(s);
        // cout << arr[i] << endl;
    }
    
    for (int i = (N-1); i >= 0; i--) {
        cout << arr[i] << " ";
    }


    return 0;
}
