// https://www.hackerrank.com/challenges/30-dictionaries-and-maps/problem

//Complete this code or write your own from scratch
import java.util.*;
import java.io.*;

class Solution{
    public static void main(String []argh){
        Map<String, String> phoneBook = new HashMap<String, String>();
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        for(int i = 0; i < n; i++){
            String name = in.next();
            String phone = in.next();
            phoneBook.put(name,phone);
            // Write code here
        }
        
        String temp;
        //temp = in.next();
        for(int i = 0; i < n; i++){
            temp = in.next();
            if(phoneBook.get(temp) == null){
                System.out.println("Not found");
            }
            else{
                System.out.println(temp + "=" + phoneBook.get(temp));
            }
        }
        in.close();
    }
}
