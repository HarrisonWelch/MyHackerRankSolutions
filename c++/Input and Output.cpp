// Input and Output.cpp

// In this challenge, we're practicing reading input from stdin and printing output to stdout.

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   

    int sum = 0;
    int num = 0;

    for (int i = 0; i < 3; i++) {
        cin >> num;
        sum += num;
    }

    cout << sum;

    return 0;
}
