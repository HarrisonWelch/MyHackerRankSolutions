import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the hourglassSum function below.
    static int hourglassSum(int[][] arr) {
        int hourglass = 0;
        int maxHourglass = -2147483648;
        for (int i = 1; i < arr.length-1; i++) {
            for (int j = 1; j < arr[i].length-1; j++) {
                hourglass = 0;
                hourglass = arr[i-1][j-1]   // Top left
                    + arr[i-1][j]           // Top Middle
                    + arr[i+1][j-1]         // Top Right
                    + arr[i][j]             // Middle Neck Point
                    + arr[i-1][j+1]         // Bottom Left
                    + arr[i+1][j]           // Bottom Middle
                    + arr[i+1][j+1];        // Bottom Right

                if (hourglass > maxHourglass) {
                    maxHourglass = hourglass;
                }
                // System.out.println("arr["+i+"]["+j+"] = " + arr[i][j]);
                // System.out.print(arr[i][j]);
            }
            // System.out.println("");
        }
        return maxHourglass;
    }

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) throws IOException {
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        int[][] arr = new int[6][6];

        for (int i = 0; i < 6; i++) {
            String[] arrRowItems = scanner.nextLine().split(" ");
            scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

            for (int j = 0; j < 6; j++) {
                int arrItem = Integer.parseInt(arrRowItems[j]);
                arr[i][j] = arrItem;
            }
        }

        int result = hourglassSum(arr);

        bufferedWriter.write(String.valueOf(result));
        bufferedWriter.newLine();

        bufferedWriter.close();

        scanner.close();
    }
}
