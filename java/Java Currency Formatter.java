// https://www.hackerrank.com/challenges/java-currency-formatter/problem

import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double payment = scanner.nextDouble();
        scanner.close();

        // Write your code here.
        NumberFormat usNF = NumberFormat.getCurrencyInstance(Locale.US);
        String us = usNF.format(payment);

        NumberFormat indiaNF = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));
        String india = indiaNF.format(payment);

        NumberFormat chinaNF = NumberFormat.getCurrencyInstance(Locale.CHINA);
        String china = chinaNF.format(payment);

        NumberFormat franceNF = NumberFormat.getCurrencyInstance(Locale.FRANCE);
        String france = franceNF.format(payment);
        
        System.out.println("US: " + us);
        System.out.println("India: " + india);
        System.out.println("China: " + china);
        System.out.println("France: " + france);
    }
}
