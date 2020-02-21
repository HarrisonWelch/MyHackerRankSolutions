// https://www.hackerrank.com/challenges/s10-standard-deviation/problem

import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner sc = new Scanner(System.in);
        String nS = sc.nextLine();
        int n = Integer.parseInt(nS);

        String arrS =  sc.nextLine();
        String[] arrStrings = arrS.split(" ");
        ArrayList<Integer> arr = new ArrayList<Integer>();
        for (int i = 0; i < arrStrings.length; i++) {
            arr.add(Integer.parseInt(arrStrings[i]));
        }

        double sum = 0;
        for (int i = 0; i < arr.size(); i++) {
            sum += arr.get(i);
        }
        double mean = sum / (double) n;

        double stdDevNumerator = 0;
        for (int i = 0; i < arr.size(); i++) {
            stdDevNumerator += Math.pow((arr.get(i) - mean),2);
        }

        double stdDev = Math.sqrt(stdDevNumerator/n);
        
        System.out.format("%.1f",stdDev);
    }
}
