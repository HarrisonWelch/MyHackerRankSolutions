// https://www.hackerrank.com/challenges/c-tutorial-strings/problem

#include <iostream>
#include <string>
using namespace std;

int main() {
	// Complete the program
    string a = "";
    string b = "";

    cin >> a;
    cin >> b;

    cout << a.length() << " " << b.length() << endl;
    cout << a << b << endl;

    char swap = a[0];
    a[0] = b[0];
    b[0] = swap;

    cout << a << " " << b << endl;
  
    return 0;
}
