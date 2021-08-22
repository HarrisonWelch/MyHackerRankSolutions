import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] ints = new int[n];
        int arraySum = 0;
        for (int i = 0; i < n; i++) {
            ints[i] = scanner.nextInt();
        }
        int count = 0;
        int subArraySum = 0;
        for (int i = 1; i < (n+1); i++) { // size of the array being summed
            for (int j = 0; j < (n-i+1); j++) { // start/stop of array being summed
                for (int k = j; k < (j+i); k++) { // iterator through the array
                    subArraySum += ints[k];
                    // System.out.println("i = " + i + ", j = " + j + ", k = " + k);
                }
                // System.out.println("subArraySum = " + subArraySum);
                if (subArraySum < 0) {
                    count++;
                }
                subArraySum = 0;
            }
        }
        System.out.println(count);
    }
}
