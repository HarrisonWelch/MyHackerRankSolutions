// https://www.hackerrank.com/challenges/30-binary-numbers/problem

import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        int max = 0;
        int maxLine = 0;
        Object temp = new Object();
        Object lastNumber = new Object();
        
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        ArrayList arr = new ArrayList();
        for(int i = 0; i < n; n/=2){
            arr.add( n % 2 );
        }
        for(int i = arr.size()-1; i >= 0; i--){
            //System.out.println(arr.get(i));
            temp = arr.get(i);
            //System.out.println("temp" + temp);
            //System.out.println("lastNumber" + lastNumber);
            if(lastNumber == temp){
                maxLine++;
            }
            else{
                maxLine = 0;
            }
            if (maxLine > max){
               max = maxLine;
            }
            lastNumber = temp;
        }
        System.out.println(max+1);
    }
}
