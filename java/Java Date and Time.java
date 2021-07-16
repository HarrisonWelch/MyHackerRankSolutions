import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

class Result {

    /*
     * Complete the 'findDay' function below.
     *
     * The function is expected to return a STRING.
     * The function accepts following parameters:
     *  1. INTEGER month
     *  2. INTEGER day
     *  3. INTEGER year
     */

    public static String findDay(int month, int day, int year) {
        String str = "";
        Calendar cal = Calendar.getInstance();
        cal.set(year, month - 1, day, 0, 0);
        int dow = cal.get(Calendar.DAY_OF_WEEK);
        switch (dow) {
            case 1:
                str = "SUNDAY";
                break;
            case 2:
                str = "MONDAY";
                break;
            case 3:
                str = "TUESDAY";
                break;
            case 4:
                str = "WEDNESDAY";
                break;
            case 5:
                str = "THURSDAY";
                break;
            case 6:
                str = "FRIDAY";
                break;
            case 7:
                str = "SATURDAY";
                break;
            default:
                str = "UNKNOWN_DAY";
        }
        return str;
    }

}

public class Solution {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        String[] firstMultipleInput = bufferedReader.readLine().replaceAll("\\s+$", "").split(" ");

        int month = Integer.parseInt(firstMultipleInput[0]);

        int day = Integer.parseInt(firstMultipleInput[1]);

        int year = Integer.parseInt(firstMultipleInput[2]);

        String res = Result.findDay(month, day, year);

        bufferedWriter.write(res);
        bufferedWriter.newLine();

        bufferedReader.close();
        bufferedWriter.close();
    }
}
