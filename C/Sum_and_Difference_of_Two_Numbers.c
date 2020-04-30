// https://www.hackerrank.com/challenges/sum-numbers-c/problem

#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main()
{
    int i1;
    int i2;

    float f1;
    float f2;

    scanf("%i", &i1);
    scanf("%i", &i2);
    scanf("%f", &f1);
    scanf("%f", &f2);

    printf("%i ",i1+i2);
    printf("%i\n",i1-i2);
    printf("%.1f ",f1+f2);
    printf("%.1f",f1-f2);
    
    return 0;
}
