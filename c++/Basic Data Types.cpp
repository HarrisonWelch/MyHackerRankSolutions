// Basic Data Types.cpp

// Some C++ data types, their format specifiers, and their most common bit widths are as follows:

// Int ("%d"): 32 Bit integer
// Long ("%ld"): 64 bit integer
// Char ("%c"): Character type
// Float ("%f"): 32 bit real value
// Double ("%lf"): 64 bit real value

// Output Format

// Print each element on a new line in the same order it was received as input. 
// Note that the floating point value should be correct up to 3 decimal places and the double to 9 decimal places.

#include <iostream>
#include <cstdio>
#include <iomanip>
using namespace std;

int main() {
    // Complete the code.

    int i;
    long l;
    char c;
    float f;
    double d;

    cin >> i;
    cin >> l;
    cin >> c;
    cin >> f;
    cin >> d;

    cout << i << endl;
    cout << l << endl;
    cout << c << endl;
    cout << fixed << setprecision(3) << f << endl;
    cout << fixed << setprecision(9) << d << endl;

    return 0;
}

