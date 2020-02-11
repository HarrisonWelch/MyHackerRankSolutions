// https://www.hackerrank.com/challenges/time-conversion/problem

import java.io.*;
import java.math.*;
import java.text.*;
import java.util.*;
import java.lang.*;
import java.util.regex.*;

public class Solution {

    /*
     * Complete the timeConversion function below.
     */
    static String timeConversion(String s) {
        /*
         * Write your code here.
         */
        String milTime = null;
        String hourStr = s.substring(0,s.indexOf(':'));
        if (s.indexOf('A') == -1) {
            // PM time
            int hourInt = Integer.parseInt(hourStr);
            
            // System.out.println("hourStr = " + hourStr);
            // System.out.println("hourInt = " + hourInt);

            if (hourStr.equals("12")) {
                // System.out.println("hourStr = " + hourStr);
                // hourStr = "00";
                return (hourInt) + s.substring(s.indexOf(':'), s.length()-2);
            } else {
                return (hourInt+12) + s.substring(s.indexOf(':'), s.length()-2);
            }

        } else {
            // AM time
            
            // System.out.println("hourStr = " + hourStr);

            if (hourStr.equals("12")) {
                // System.out.println("hourStr = " + hourStr);
                hourStr = "00";
            }

            return hourStr + s.substring(s.indexOf(':'), s.length()-2);
        }

        // return "SOMETHING SCREWED UP";

    }

    private static final Scanner scan = new Scanner(System.in);

    public static void main(String[] args) throws IOException {
        BufferedWriter bw = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        String s = scan.nextLine();

        String result = timeConversion(s);

        bw.write(result);
        bw.newLine();

        bw.close();
    }
}