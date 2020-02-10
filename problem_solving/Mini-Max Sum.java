import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;
import java.lang.Math.*;

public class Solution {

    // Complete the miniMaxSum function below.
    static void miniMaxSum(int[] arr) {
        ArrayList<Long> sums = new ArrayList<Long>();
        long minSum = (long) Math.pow(2,60);
        long maxSum = (long) Math.pow(2,60);
        maxSum = -1 * maxSum;
        long sum = 0;
        for (int i = 0; i < arr.length; i++) {
            sum = 0;
            for (int j = 0; j < arr.length; j++) {
                if (i == j) continue;
                sum = sum + arr[j];
            }
            sums.add(sum);
        }
        // for (int i = 0; i < sums.size(); i++){
        //     System.out.println(sums.get(i));
        // }
        for (int i = 0; i < arr.length; i++) {
            if(sums.get(i) < minSum){
                minSum = sums.get(i);
            }
            if(sums.get(i) > maxSum){
                maxSum = sums.get(i);
            }
        }
        System.out.print(minSum + " " + maxSum);
        
    }

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        int[] arr = new int[5];

        String[] arrItems = scanner.nextLine().split(" ");
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        for (int i = 0; i < 5; i++) {
            int arrItem = Integer.parseInt(arrItems[i]);
            arr[i] = arrItem;
        }

        miniMaxSum(arr);

        scanner.close();
    }
}
