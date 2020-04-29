// https://www.hackerrank.com/challenges/30-2d-arrays/problem

import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        int hourglass = Integer.MIN_VALUE;
        int maxHourglass = Integer.MIN_VALUE;
        Scanner in = new Scanner(System.in);
        int arr[][] = new int[6][6];
        for(int i=0; i < 6; i++){
            for(int j=0; j < 6; j++){
                arr[i][j] = in.nextInt();
            }
        }
        //System.out.println(arr[1][0]);
        //System.out.println(arr[0][1]);
        //arr[row][col]

        for(int i=1; i < 5; i++){
            for(int j=1; j < 5; j++){
                
                hourglass = arr[i-1][j-1] + arr[i-1][j] + arr[i-1][j+1] +
                                            arr[i][j] +
                            arr[i+1][j-1] + arr[i+1][j] + arr[i+1][j+1];
                
                if(hourglass > maxHourglass){ 
                    maxHourglass = hourglass;
                }
                                             
            }
        }
        System.out.println(maxHourglass);
    }
}
