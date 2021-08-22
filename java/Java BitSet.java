import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        // BitSet b1 = new
        Scanner scanner = new Scanner(System.in);
        
        int n = scanner.nextInt();
        BitSet b1 = new BitSet(n);
        BitSet b2 = new BitSet(n);
        
        int m = scanner.nextInt();
        scanner.nextLine();
        String[] lineTokens;
        int set = -1;
        int index = -1;
        String command = "";
        
        for (int i = 0; i < m; i++) {
            lineTokens = scanner.nextLine().split(" ");
            command = lineTokens[0];
            set = Integer.parseInt(lineTokens[1]);
            index = Integer.parseInt(lineTokens[2]);
            
            switch (command) {
                case "AND":
                    if (set == 1) {
                        b1.and(b2);
                    } else {
                        b2.and(b1);
                    }
                    break;
                case "OR":
                    if (set == 1) {
                        b1.or(b2);
                    } else {
                        b2.or(b1);
                    }
                    break;
                case "XOR":
                    if (set == 1) {
                        b1.xor(b2);
                    } else {
                        b2.xor(b1);
                    }
                    break;
                case "FLIP":
                    if (set == 1) {
                        b1.flip(index);
                    } else {
                        b2.flip(index);
                    }
                    break;
                case "SET":
                    if (set == 1) {
                        b1.set(index);
                    } else {
                        b2.set(index);
                    }
                    break;
                default:
                    System.out.println("Something broke");
            }
            System.out.println(b1.cardinality() + " " + b2.cardinality());
        }
    }
}
