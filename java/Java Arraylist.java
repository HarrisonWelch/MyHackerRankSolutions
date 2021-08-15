import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner scanner = new Scanner(System.in);
        int n = Integer.parseInt(scanner.nextLine());
        ArrayList<ArrayList<Integer>> list = new ArrayList<ArrayList<Integer>>();
        ArrayList<Integer> lineList = new ArrayList<Integer>();
        int d = 0;
        int di = 0;
        for (int i = 0; i < n; i++) {
            d = scanner.nextInt();
            // System.out.println(d);
            for (int j = 0; j < d; j++) {
                di = scanner.nextInt();
                // System.out.println("di = " + di);
                lineList.add(di);
            }
            list.add(lineList);
            lineList = new ArrayList<Integer>();
        }
        // for (int i = 0; i < list.size(); i++) {
        //     System.out.println("i = " + i);
        //     for (int j = 0; j < list.get(i).size(); j++) {
        //         System.out.print("j = " + list.get(i).get(j));
        //     }
        //     System.out.println("");
        // }
        int q = scanner.nextInt();
        // System.out.println("q = " + q);
        int qi = 0;
        int qj = 0;
        for (int i = 0; i < q; i++) {
            try {
                qi = scanner.nextInt();
                qj = scanner.nextInt();
                // System.out.println("qi-1 = " + (qi - 1));
                // System.out.println("qj-1 = " + (qj - 1));
                System.out.println(list.get(qi-1).get(qj-1));
            } catch (IndexOutOfBoundsException e) {
                System.out.println("ERROR!");
            }
        }
    }
}
