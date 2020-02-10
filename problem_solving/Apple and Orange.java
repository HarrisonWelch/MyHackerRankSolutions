import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the countApplesAndOranges function below.
    static void countApplesAndOranges(int s, int t, int a, int b, int[] apples, int[] oranges) {

        // System.out.println("s = " + s);
        // System.out.println("t = " + t);
        // System.out.println("a = " + a);
        // System.out.println("b = " + b);

        // for(int i = 0; i < apples.length; i++) {
        //     System.out.println("apples["+i+"] = " + apples[i]);
        // }
        // for(int i = 0; i < oranges.length; i++) {
        //     System.out.println("oranges["+i+"] = " + oranges[i]);
        // }
        
        ArrayList<Integer> applePositions = new ArrayList<Integer>();
        ArrayList<Integer> orangePositions = new ArrayList<Integer>();
        int applesInRange = 0;
        int orangesInRange = 0;
        
        for(int i = 0; i < apples.length; i++) {
            applePositions.add(apples[i] + a);
            // System.out.println("apples["+i+"] = " + applePositions.get(i));
            // applePositions.get(i);
        }
        for(int i = 0; i < oranges.length; i++) {
            orangePositions.add(oranges[i] + b);
            // System.out.println("apples["+i+"] = " + orangePositions.get(i));
            // orangePositions.get(i);
        }

        for(int i = 0; i < apples.length; i++) {
            if (applePositions.get(i) >= s && 
                applePositions.get(i) <= t) {
                    applesInRange++;
                }
        }
        for(int i = 0; i < oranges.length; i++) {
            if (orangePositions.get(i) >= s && 
                orangePositions.get(i) <= t) {
                    orangesInRange++;
                }
        }

        // System.out.println("applesInRange = " + applesInRange);
        // System.out.println("orangesInRange = " + orangesInRange);
        System.out.println(applesInRange);
        System.out.println(orangesInRange);
    }

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        String[] st = scanner.nextLine().split(" ");

        int s = Integer.parseInt(st[0]);

        int t = Integer.parseInt(st[1]);

        String[] ab = scanner.nextLine().split(" ");

        int a = Integer.parseInt(ab[0]);

        int b = Integer.parseInt(ab[1]);

        String[] mn = scanner.nextLine().split(" ");

        int m = Integer.parseInt(mn[0]);

        int n = Integer.parseInt(mn[1]);

        int[] apples = new int[m];

        String[] applesItems = scanner.nextLine().split(" ");
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        for (int i = 0; i < m; i++) {
            int applesItem = Integer.parseInt(applesItems[i]);
            apples[i] = applesItem;
        }

        int[] oranges = new int[n];

        String[] orangesItems = scanner.nextLine().split(" ");
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        for (int i = 0; i < n; i++) {
            int orangesItem = Integer.parseInt(orangesItems[i]);
            oranges[i] = orangesItem;
        }

        countApplesAndOranges(s, t, a, b, apples, oranges);

        scanner.close();
    }
}
