#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	
    int n;
    char buffer[50];
    scanf("%d", &n);
    // char str[] = "";
    int str = 0;
    sprintf(buffer, "%d", n);
    // printf(buffer);
    // printf("\n");
    // printf(strlen(buffer));
    char a[20]="Program";
    int len = strlen(buffer);

    // using the %zu format specifier to print size_t
    // printf("Length of string a = %zu \n",strlen(a));
    // printf("Length of string buffer = %zu \n",strlen(buffer));

    //Complete the code to calculate the sum of the five digits on n.

    int ans = 0;

    // printf("n = %d\n", n);
    // printf("(n % 10) = %d\n", (n % 10));
    // printf("ans + (n % 10) = %d\n", ans + (n % 10));
    // ans = ans + (n % 10);
    for (int i = 0; i < strlen(buffer); i++) {
        // printf("YEET\n");
        ans = ans + (n % 10);
        n = n / 10;
    }

    printf("%d", ans);

    return 0;
}
