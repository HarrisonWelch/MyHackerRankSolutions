// https://www.hackerrank.com/challenges/java-end-of-file/problem

import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */

        Scanner sc = new Scanner(System.in);
        String line = "";
        int lineNum = 1;
        while (sc.hasNext()) {
            line = sc.nextLine();
            System.out.print(lineNum++ + " ");
            System.out.println(line);
        }
    }
}
