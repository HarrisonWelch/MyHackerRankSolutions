// https://www.hackerrank.com/challenges/s10-basic-statistics/problem

import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        String nums = sc.nextLine();

        ArrayList<Integer> arr = new ArrayList<Integer>();
        
        int nInt = 0;
        while (sc.hasNextInt()) {
            nInt = sc.nextInt();
            // System.out.println(nInt);
            arr.add(nInt);
        }
        
        Collections.sort(arr);

        double sum = 0;
        for (int i = 0; i < arr.size(); i++) {
            sum += arr.get(i);
        }
        double mean = sum / (double) n;
        System.out.format("%.1f",mean);
        System.out.println();

        // Median
        double median = -1;
        if (n % 2 == 0){
            median = (arr.get(n/2) + arr.get((n/2)-1)) / 2.0;
        } else {
            median = arr.get((n/2)-1);
        }
        System.out.format("%.1f",median);
        System.out.println();

        // Mode
        HashMap<Integer, Integer> hashArr = new HashMap<Integer, Integer>();
        int max = 1;
        int mode = arr.get(0);
        for (int i = 0; i < arr.size(); i++) {
            // System.out.println("arr.get(i) = " + arr.get(i));
            // System.out.println("hashArr.get(arr.get(i) = " + hashArr.get(arr.get(i)));
            if (hashArr.get(arr.get(i)) != null) {
                // System.out.println(arr.get(i));
                int count = hashArr.get(arr.get(i));
                count++;
                hashArr.put(arr.get(i), count);
                if (count > max) {
                    max = count;
                    mode = arr.get(i);
                }
            } else {
                hashArr.put(arr.get(i), 1);
            }
        }
        System.out.println(mode);
    }
}
