import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution{
	public static void main(String[] args){
		
		Scanner in = new Scanner(System.in);
		int testCases = Integer.parseInt(in.nextLine());
        StringBuilder text = new StringBuilder();
        boolean closingTag = false;
        boolean tagText = false;
        
        // Stack<String> stack = new Stack<String>();
        String activeTag = "";
        // String temp = "";
        String potentialText = "";
		while(testCases > 0){
			String line = in.nextLine();
			
          	//Write your code here
            for (int i = 0; i < line.length(); i++) {
                switch (line.charAt(i)) {
                    case '<':
                        potentialText = text.toString();
                        text.setLength(0);
                        tagText = true;
                        break;
                    case '>':
                        // TAG CLOSE
                        
                        if (tagText) {
                            if (closingTag) {
                                    // System.out.println(
                                    //     "activeTag = " + activeTag);
                                    // System.out.println(
                                    //     "text.toString() = ~" + text.toString() + "~");
                                if (activeTag.equals(text.toString())) {
                                    // System.out.println(
                                        // "potentialText = " + potentialText);
                                    System.out.println(potentialText);
                                    potentialText = "";
                                    activeTag = "";
                                }
                            } else {
                                activeTag = text.toString();
                                text.setLength(0);
                                // System.out.println("activeTag = " + activeTag);
                            }
                        }
                        
                        closingTag = false;
                        tagText = false;
                        break;
                    case '/':
                        closingTag = true;
                        // System.out.println("closingTag = " + closingTag);
                        break;
                    default:
                        text.append(line.charAt(i));
                }
            }
            // System.out.println("");
			testCases--;
		}
	}
}
