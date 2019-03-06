// Pointer.cpp

// A pointer in C is a way to share a memory address among 
// different contexts (primarily functions). They are primarily 
// used whenever a function needs to modify the content of a variable, 
// of which it doesn't have ownership. 

#include <stdio.h>
#include <iostream>
#include <cstdlib>

void update(int *a,int *b) {
    // Complete this function
    *a = *a+*b;
    *b = std::abs(*b-((*a)-(*b)));
}

int main() {
    int a, b;
    int *pa = &a, *pb = &b;
    
    scanf("%d %d", &a, &b);
    update(pa, pb);
    printf("%d\n%d\n", a, b);

    return 0;
}

