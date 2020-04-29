// https://www.hackerrank.com/challenges/30-nested-logic/problem

import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner keyboard = new Scanner(System.in);
        int actualDay = keyboard.nextInt();
        int actualMonth = keyboard.nextInt();
        int actualYear = keyboard.nextInt();
        int expectedDay = keyboard.nextInt();
        int expectedMonth = keyboard.nextInt();
        int expectedYear = keyboard.nextInt();
        
        int total = 0;
        /*
        System.out.println("actualDay : "+actualDay);
        System.out.println("actualMonth : "+actualMonth);
        System.out.println("actualYear : "+actualYear);
        System.out.println("expectedDay : "+expectedDay);
        System.out.println("expectedMonth : "+expectedMonth);
        System.out.println("expectedYear : "+expectedYear);
        */
        if( expectedYear > actualYear ){
            // DO NOTHING
        } else if ( actualYear  > expectedYear  ){
            total = 10000;
        } else if ( actualMonth > expectedMonth ){
            total += (actualMonth - expectedMonth) * 500;
        } else if ( actualDay   > expectedDay   ){
            total += (actualDay - expectedDay) * 15;
        } else {
            total = 0;
        }
        
        /*
        
        if(expectedYear < actualYear){
            total = 10000;
        } else if ( expectedMonth > actualMonth ){
            total += (actualMonth - expectedMonth) * 500;
        } else if ( expectedDay > actualDay ){
            total += (actualDay - expectedDay) * 500;
        }
        
        */
        
        
        System.out.println(total);
        
    }
}
