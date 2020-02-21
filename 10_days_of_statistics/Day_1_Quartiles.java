// https://www.hackerrank.com/challenges/s10-quartiles/problem

import java.io.*;
import java.util.*;

public class Solution {

    public static double quartile (List<Integer> arr) {
        // System.out.println("arr.get(0) = " + arr.get(0));
        // System.out.println("arr.get(arr.size()-1) = " + arr.get(arr.size()-1));
        double median = -1;
        int n = arr.size();
        if (n % 2 == 0){
            median = (arr.get(n/2) + arr.get((n/2)-1)) / 2.0;
        } else {
            median = arr.get(n/2);
        }
        return median;
    }

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
        Collections.sort(arr);
        // System.out.println("n = " + n);
        // System.out.println("arr.get(n/2) = " + arr.get(n/2));
        double q1 = -1;
        double q2 = -1;
        double q3 = -1;

        q2 = quartile(arr);

        if (arr.size() % 2 == 0) {
            q1 = quartile(arr.subList(0, (n/2)));
            q3 = quartile(arr.subList((n/2), n));
        } else {
            q1 = quartile(arr.subList(0, (n/2)));
            q3 = quartile(arr.subList((n/2)+1, n));
        }

        System.out.println((int)q1);
        System.out.println((int)q2);
        System.out.println((int)q3);
    }
}
