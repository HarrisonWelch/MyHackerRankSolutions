import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner sc = new Scanner(System.in);
        // int n = sc.nextInt();
        // String nums = sc.nextLine();

        String nS = sc.nextLine();
        String nums = sc.nextLine();
        String weights = sc.nextLine();

        int n = Integer.parseInt(nS);
        String[] arrXStrings = nums.split(" ");
        ArrayList<Integer> arrX = new ArrayList<Integer>();
        for (int i = 0; i < arrXStrings.length; i++) {
            arrX.add(Integer.parseInt(arrXStrings[i]));
        }

        String[] arrWStrings = weights.split(" ");
        ArrayList<Integer> arrW = new ArrayList<Integer>();
        for (int i = 0; i < arrWStrings.length; i++) {
            arrW.add(Integer.parseInt(arrWStrings[i]));
        }
        
        int numerator = 0;
        int denominator = 0;


        for (int i = 0; i < arrX.size(); i++) {
            numerator += arrX.get(i) * arrW.get(i);
        }
        

        for (int i = 0; i < arrW.size(); i++) {
            denominator += arrW.get(i);
        }

        System.out.format("%.1f",( (double) numerator / (double) denominator));
    }
}
