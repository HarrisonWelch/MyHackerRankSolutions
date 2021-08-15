import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.function.*;
import java.util.regex.*;
import java.util.stream.*;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;



public class Solution {
    public static void main(String[] args) throws IOException {
        Scanner scanner = new Scanner(System.in);
        
        BigInteger n_int = scanner.nextBigInteger();
        
        System.out.println(n_int.isProbablePrime(100) ? "prime" : "not prime");

        scanner.close();
    }
}


// vvv Prev attempt vvv

import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.function.*;
import java.util.regex.*;
import java.util.stream.*;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;



public class Solution {
    public static void main(String[] args) throws IOException {
        Scanner scanner = new Scanner(System.in);
        
        BigInteger n_int = scanner.nextBigInteger();
        boolean is_prime = true;
        
        // System.out.println(n_int);
        
        // System.out.println(true ? "123" : "456");
        
        if (n_int.equals(new BigInteger("" + 0))){
            is_prime = false;
            System.out.println(is_prime ? "prime" : "not prime");
            scanner.close();
            return;
        }
        if (n_int.equals(new BigInteger("" + 1))){
            is_prime = false;
            System.out.println(is_prime ? "prime" : "not prime");
            scanner.close();
            return;
        }
        
        if (n_int.mod(new BigInteger("" + 2)).equals(new BigInteger("" + 0))){
            is_prime = true;
            System.out.println(is_prime ? "prime" : "not prime");
            scanner.close();
            return;
        }
        if (n_int.mod(new BigInteger("" + 3)).equals(new BigInteger("" + 0))){
            is_prime = true;
            System.out.println(is_prime ? "prime" : "not prime");
            scanner.close();
            return;
        }
        
        if (is_prime) {
            for (int i = 4; n_int.compareTo(new BigInteger("" + i)) == -1; i++) {
                if (n_int.mod(new BigInteger("" + i)).equals(new BigInteger("" + 0))) {
                    is_prime = false;
                }
            }
        }
        
        System.out.println(is_prime ? "prime" : "not prime");

        scanner.close();
    }
}
