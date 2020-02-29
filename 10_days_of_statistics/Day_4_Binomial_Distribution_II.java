// https://www.hackerrank.com/challenges/s10-binomial-distribution-1/problem

import java.io.*;
import java.util.*;

public class Solution {

    public static double factorial (double n) {
        if (n == 0.0 || n == 1.0) {return 1.0;}
        return n * factorial(n-1);
    }

    public static double combo (double n, double k){
        return factorial(n) / (factorial(k) * factorial(n-k));
    }

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */

        // b(x,n,p) = nCx * p^x * q^(n-x)

        Scanner sc = new Scanner(System.in);
        String input = sc.nextLine();
        // System.out.println(input);
        String[] nums = input.split(" ", -1);

        double p1 = Double.parseDouble(nums[0]);
        double n = Double.parseDouble(nums[1]);

        // System.out.println(numer);
        // System.out.println(denom);

        // double n = 6;
        double k = 2;

        // double binom = factorial(n) / (factorial(k) * factorial(n-k));
        // System.out.println(binom);

        // double p = (numer/denom) / (1+(numer/denom));
        double p = p1 / 100;

        double ansAtLeast2 = 0.0;
        double ansNoMoreThan2 = 0.0;
        for (int i = (int)k; i < n+1; i++) {
            ansAtLeast2 += combo(n, i) *
                   Math.pow(p, i) *
                   Math.pow(1.0 - p, n-i);
        }
        for (int i = 0; i < ((int)k)+1; i++) {
            ansNoMoreThan2 += combo(n, i) *
                   Math.pow(p, i) *
                   Math.pow(1.0 - p, n-i);
        }

        // System.out.println(ans);
        // System.out.printf("ansNoMoreThan2 = %.3f", ansNoMoreThan2);
        // System.out.println();
        // System.out.printf("ansAtLeast2 = %.3f", ansAtLeast2);
        System.out.printf("%.3f", ansNoMoreThan2);
        System.out.println();
        System.out.printf("%.3f", ansAtLeast2);
    }
}
