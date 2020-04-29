// https://www.hackerrank.com/challenges/30-review-loop/problem

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <string>
using namespace std;


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */  
    int n = 0;
    int help = 0;
    
    string temp;
    
    getline(cin, temp);
    help = temp.length();
    for(int i = 0; i < temp.length(); i++){
        if(help > 1){
            n += (temp[i] - 48) * pow(10, help - 1); 
            //cout << "n += (temp[i] - 48) * pow(10, help - 1)" << (temp[i] - 48) * pow(10, help - 1) << endl;
        }
        else{
            n += temp[i] - 48;
        }
        //cout << n << endl;
        help--;
    }
    //cout << n << endl;
    cin.clear();
    cin.sync();
    //cout << temp << endl;
    for(int j = 0; j < n; j++){
        getline(cin,temp);
        //cout << "Hello\n";
        for(int i = 0; i < temp.length(); i++){
            if(i % 2 == 0){
                cout << temp[i];
            }
        }
        cout << " ";
        for(int k = 0; k < temp.length(); k++){
            if(k % 2 == 1){
                cout << temp[k];
            }
        }
        cout << endl;
    }
    return 0;
}
