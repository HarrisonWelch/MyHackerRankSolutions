// https://www.hackerrank.com/challenges/java-string-reverse/problem

import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        
        Scanner sc=new Scanner(System.in);
        String A=sc.next();
        /* Enter your code here. Print output to STDOUT. */
        boolean palFlag = true;
        for (int i = 0; i < (A.length() / 2) + 1; i++) {
            if (A.charAt(i) != A.charAt(A.length()-1-i)){
                System.out.println("No");
                palFlag = false;
                break;
            }
        }

        if (palFlag) {
            System.out.println("Yes");
        }
        
    }
}
