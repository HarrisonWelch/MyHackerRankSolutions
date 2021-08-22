import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;



public class Solution {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));

        List<List<Integer>> arr = new ArrayList<>();

        for (int i = 0; i < 6; i++) {
            String[] arrRowTempItems = bufferedReader.readLine().replaceAll("\\s+$", "").split(" ");

            List<Integer> arrRowItems = new ArrayList<>();

            for (int j = 0; j < 6; j++) {
                int arrItem = Integer.parseInt(arrRowTempItems[j]);
                arrRowItems.add(arrItem);
            }

            arr.add(arrRowItems);
        }
        
        int sum = 0;
        int greatestSum = -999;
        for (int i = 1; i < 5; i++) {
            for (int j = 1; j < 5; j++) {
                sum = arr.get(i-1).get(j-1) +
                      arr.get(i-1).get(j) +
                      arr.get(i-1).get(j+1) +
                      arr.get(i).get(j) +
                      arr.get(i+1).get(j-1) +
                      arr.get(i+1).get(j) +
                      arr.get(i+1).get(j+1);
                // System.out.println("i = " + i + ", j = " + j + ", sum = " + sum);
                if (sum > greatestSum) {
                    greatestSum = sum;
                }
            }
        }
        System.out.println(greatestSum);

        bufferedReader.close();
    }
}
