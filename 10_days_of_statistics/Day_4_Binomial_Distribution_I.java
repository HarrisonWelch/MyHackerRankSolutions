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

        double numer = Double.parseDouble(nums[0]);
        double denom = Double.parseDouble(nums[1]);

        // System.out.println(numer);
        // System.out.println(denom);

        double n = 6;
        double k = 3;

        double binom = factorial(n) / (factorial(k) * factorial(n-k));
        // System.out.println(binom);

        double p = (numer/denom) / (1+(numer/denom));

        double ans = 0.0;
        for (int i = 3; i < n+1; i++) {
            ans += combo(n, i) *
                   Math.pow(p, i) *
                   Math.pow(1.0 - p, n-i);
        }
        // System.out.println(ans);
        System.out.printf("%.3f", ans);
    }
}
