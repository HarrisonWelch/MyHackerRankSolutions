import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the repeatedString function below.
    static long repeatedString(String s, long n) {

        // Number of a's in the string * n/length of string + excess
        // excess = number of a's in the substring of 0->(n%length of substring)

        long result = 0;
        int asInString = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == 'a') {
                asInString++;
            }
        }
        result = asInString * (n / s.length());
        if (n % s.length() != 0) {
            String subStr = s.substring(0, (int)(n % s.length()));
            asInString = 0;
            for(int i = 0; i < subStr.length(); i++) {
                if (s.charAt(i) == 'a') {
                    asInString++;
                }
            }
            result = result + asInString;
        }
        return result;
    }

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) throws IOException {
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        String s = scanner.nextLine();

        long n = scanner.nextLong();
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        long result = repeatedString(s, n);

        bufferedWriter.write(String.valueOf(result));
        bufferedWriter.newLine();

        bufferedWriter.close();

        scanner.close();
    }
}
