import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        int n = scanner.nextInt();
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        scanner.close();
        
//         If  is odd, print Weird
        if (n % 2 == 1){
            print("Weird");
        }
// If  is even and in the inclusive range of 2 to 5, print Not Weird
        if ( n % 2 == 0 && (n >= 2 && n <=5)){
            print("Not Weird");
        }
// If  is even and in the inclusive range of 6 to 20, print Weird
        if ( n % 2 == 0 &&  (n >= 6 && n <= 20 )){
            print("Weird");
        }
// If  is even and greater than 20, print Not Weird
        if ( n % 2 == 0 &&  n > 20 ){
            print("Not Weird");
        }
    }
    
    public static void print(String str){
        System.out.println(str);
    }
}
