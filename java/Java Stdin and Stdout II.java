import java.util.Scanner;

public class Solution {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        // int i = scan.nextInt();

        // Write your code here.
        String s = "";
        double d = 0.0;
        int i = 0;
        
        i = Integer.parseInt(scan.nextLine());
        d = Double.parseDouble(scan.nextLine());
        s = scan.nextLine();

        System.out.println("String: " + s);
        System.out.println("Double: " + d);
        System.out.println("Int: " + i);
    }
}
