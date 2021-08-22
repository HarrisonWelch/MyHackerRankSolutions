import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        
        Scanner scanner = new Scanner(System.in);
        
        int l = Integer.parseInt(scanner.nextLine());
        
        ArrayList<Integer> list = new ArrayList<Integer>();
        
        for (int i = 0; i < l; i++) {
            list.add(scanner.nextInt());
        }
        
        int q = scanner.nextInt();
        
        String command = scanner.nextLine();
        int x = 0;
        int y = 0;
        String[] words = {};
        
        for (int i = 0; i < q; i++) {
            command = scanner.nextLine();
            switch (command) {
                case "Insert":
                    x = scanner.nextInt();
                    y = scanner.nextInt();
                    if (scanner.hasNextLine()) {
                        scanner.nextLine();
                    }
                    list.add(x,y);
                    break;
                case "Delete":
                    x = scanner.nextInt();
                    if (scanner.hasNextLine()) {
                        scanner.nextLine();
                    }
                    list.remove(x);
                    break;
                default:
                    System.out.println("WTF");
            }
        }
        
        for (int i = 0; i < list.size(); i++) {
            System.out.print(list.get(i) + " ");
        }
        
    }
}