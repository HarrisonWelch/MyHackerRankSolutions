// https://www.hackerrank.com/challenges/vector-sort/problem

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   

    string len;
    string item;
    vector<int> v;

    cin >> len;

    // cout << len << endl << item << endl;

    // cin >> item;

    // cout << len << endl << item << endl;

    for (int i = 0; i < stoi(len); i++) {
        cin >> item;
        v.push_back(stoi(item));
    }

    sort(v.begin(), v.end());

    for (int i = 0; i < stoi(len); i++) {
        cout << v[i] << " ";
    }

    return 0;
}
