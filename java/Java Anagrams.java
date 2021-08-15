import java.util.Scanner;

public class Solution {

    static boolean isAnagram(String a, String b) {
        // Complete the function
        a = a.toUpperCase();
        b = b.toUpperCase();
        
        int[] aLetterCounts = {0,0,0,0,0,0,0,0,0,0,0,0,0,
                               0,0,0,0,0,0,0,0,0,0,0,0,0};
        int[] bLetterCounts = {0,0,0,0,0,0,0,0,0,0,0,0,0,
                               0,0,0,0,0,0,0,0,0,0,0,0,0};
        
        for (int i = 0; i < a.length(); i++) {
            aLetterCounts[((int) a.charAt(i)) - 65] = 
                aLetterCounts[((int) a.charAt(i)) - 65] + 1;
        }
        for (int i = 0; i < b.length(); i++) {
            bLetterCounts[((int) b.charAt(i)) - 65] = 
                bLetterCounts[((int) b.charAt(i)) - 65] + 1;
        }
        
        boolean matches = true;
        for (int i = 0; i < aLetterCounts.length; i++) {
            if (aLetterCounts[i] != bLetterCounts[i]) {
                matches = false;
            }
        }
        
        return matches;
    }

    public static void main(String[] args) {
    
        Scanner scan = new Scanner(System.in);
        String a = scan.next();
        String b = scan.next();
        scan.close();
        boolean ret = isAnagram(a, b);
        System.out.println( (ret) ? "Anagrams" : "Not Anagrams" );
    }
}
