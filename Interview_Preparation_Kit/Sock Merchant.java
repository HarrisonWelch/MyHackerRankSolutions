import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the sockMerchant function below.
    static int sockMerchant(int n, int[] ar) {
        int result = 0;
        ArrayList<Integer> usedSocks = new ArrayList<Integer>(Collections.nCopies(n, 0));
        
        // for(int i = 0; i < n; i++) {
        //     System.out.println("usedSocks[" + i + "] = " + usedSocks.get(i));
        // }

        for(int i = 0; i < n; i++) {
            // System.out.println("I'm here");
            if (usedSocks.get(i) == 1) {
                // System.out.println("Already used sock i="+i+".");
                continue;
            }
            int match = ar[i];
            usedSocks.set(i,1);
            for (int j = 1; j < n; j++) {
                if (usedSocks.get(j) != 1 && match == ar[j]) {
                    // System.out.println("Found match i="+i+", j="+j);
                    result++;
                    usedSocks.set(j, 1);
                    break;
                }
            }
        }

        // for(int i = 0; i < n; i++) {
        //     System.out.println("usedSocks[" + i + "] = " + usedSocks.get(i));
        // }

        return result;
    }

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) throws IOException {
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        int n = scanner.nextInt();
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        int[] ar = new int[n];

        String[] arItems = scanner.nextLine().split(" ");
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        for (int i = 0; i < n; i++) {
            int arItem = Integer.parseInt(arItems[i]);
            ar[i] = arItem;
        }

        int result = sockMerchant(n, ar);

        bufferedWriter.write(String.valueOf(result));
        bufferedWriter.newLine();

        bufferedWriter.close();

        scanner.close();
    }
}
