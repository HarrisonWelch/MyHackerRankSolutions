// https://www.hackerrank.com/challenges/30-testing/problem

#include <algorithm>
#include <iostream>
#include <stdexcept>
#include <vector>
#include <cassert>
#include <set>

using namespace std;

int minimum_index(vector<int> seq) {
    if (seq.empty()) {
        throw invalid_argument("Cannot get the minimum value index from an empty sequence");
    }
    int min_idx = 0;
    for (int i = 1; i < seq.size(); ++i) {
        if (seq[i] < seq[min_idx]) {
            min_idx = i;
        }
    }
    return min_idx;
}

/*
#include <iostream>

using namespace std;

int main(){
    
    cout << "5" << endl;
    //yes
    cout << "3 4" << endl;
    cout << "5 0 -3" << endl; // sum = 2
    //no 
    cout << "4 5" << endl;
    cout << "6 8 -2 0" << endl; //sum = 12
    //yes
    cout << "5 2" << endl;
    cout << "3 -4 0 -6 7" << endl; // sum = 0
    //no 
    cout << "6 7" << endl;
    cout << "5 6 7 8 0 -3" << endl; // sum = 23
    //yes
    cout << "7 2" << endl;
    cout << "-1 -1 0 -2 2 -1 -1"; // sum = -4
    */
    
    #include<iostream>
using namespace std;
int main(){
    cout<<"5"<<endl; 
    cout<<"5 3"<<endl; cout<<"-1 90 999 100 0"<<endl;
    cout<<"4 2"<<endl; cout<<"0 -1 2 1"<<endl;
    cout<<"3 3"<<endl; cout<<"-1 0 1"<<endl;
    cout<<"6 1"<<endl; cout<<"-1 0 1 -1 2 3"<<endl;
    cout<<"7 3"<<endl; cout<<"-1 0 1 2 3 4 5"<<endl;   
    
    return 0;
    
}
