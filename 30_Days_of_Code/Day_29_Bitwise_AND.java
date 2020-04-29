// https://www.hackerrank.com/challenges/30-bitwise-and/problem

import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int t = in.nextInt();
        //int[] nums = new int[t*t*2];
        for(int a0 = 0; a0 < t; a0++){
            int n = in.nextInt();
            int k = in.nextInt();
            int[] nums = new int[n*n];
            int numsIndex = 0;
            int maxCandidate = 0;
            for(int i = 1; i < n; i++){
                for(int j = i+1; j <= n; j++){
                    //nums[numsIndex] = i & j;
                    //numsIndex++;
                    if( (i & j) > maxCandidate && (i & j) < k){
                        maxCandidate = (i & j);
                    }
                }
            }
            //print the result
            System.out.println(maxCandidate);
            
            //for(int i = 0; i < n*n; i++){
            //    System.out.println(nums[i]);
            //}
            //System.out.println("============================");
        }
    }
}
