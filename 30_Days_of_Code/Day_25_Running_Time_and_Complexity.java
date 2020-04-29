// https://www.hackerrank.com/challenges/30-running-time-and-complexity/problem

import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. */
        Scanner keyboard = new Scanner(System.in);
        int n = keyboard.nextInt();
        Vector<Integer> vec = new Vector<>();
        for(int i = 0; i < n; i++){
            vec.add(keyboard.nextInt());
        }
        boolean isPrime = true;
        for(int i = 0; i < vec.size(); i++){
            isPrime = true;
            if(vec.elementAt(i) <= 1){
                System.out.println("Not prime");
                continue;
            }
            for(int j = 2; j*j <= vec.elementAt(i); j++){
                //System.out.println("j : " + j);
                if(vec.elementAt(i) % j == 0){
                    System.out.println("Not prime");
                    isPrime = false;
                    break;
                }
            }
            if(isPrime){
                System.out.println("Prime");
            }
        }
        /*
        for(int i = 0; i < vec.size(); i++){
            isPrime = true;
            for(int j = vec.elementAt(i) - 1; j > 1; j--){
                //System.out.println("j : " + j);
                if(vec.elementAt(i) % j == 0){
                    System.out.println("Not prime");
                    isPrime = false;
                    break;
                }
            }
            if(isPrime){
                System.out.println("Prime");
            }
        }
        */
        
        /*
        
        for(int i = 0; i < vec.size(); i++){
            isPrime = true;
            for(int j = (int)Math.sqrt((double)vec.elementAt(i)); j > 1; j = (int)Math.sqrt((double)j)){
                System.out.println("j : " + j);
                if(vec.elementAt(i) % j == 0){
                    System.out.println("Not prime");
                    isPrime = false;
                }
            }
            if(isPrime){
                System.out.println("Prime");
            }
        }
        
        */
    }
}
