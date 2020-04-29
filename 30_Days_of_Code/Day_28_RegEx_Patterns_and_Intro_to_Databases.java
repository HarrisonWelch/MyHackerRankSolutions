// https://www.hackerrank.com/challenges/30-regex-patterns/problem

import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

class Person{
    String name;
    String email;

    public Person(String name, String email){
        this.name = name;
        this.email = email;
    }
    
    public String getName(){
        return name;
    }
    public String getEmail(){
        return email;
    }
}

public class Solution {
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        ArrayList<Person> fullTable = new ArrayList<Person>();
        String[] pulledNames = new String[N];
        int k = 0;
        int j = 0;
        for(int a0 = 0; a0 < N; a0++){
            String firstName = in.next();
            String emailID = in.next();
            fullTable.add( new Person( firstName, emailID ) );
            if(emailID.contains("@gmail.com")){
                pulledNames[k] = firstName;
                //System.out.println("=== " + pulledNames[j]);
                //j++;
                k++;
            }
        }
        
        //Arrays.sort(pulledNames);
        
        String[] names2 = new String[k];
        
        names2 = Arrays.copyOfRange(pulledNames,0,k);
        
        Arrays.sort(names2);
        
        //for(int i = 0; i < N; i++){
        //    if(fullTable.get(i).getEmail().contains("@gmail.com")){
        //        pulledNames[i] = fullTable.get(i).getName();
        //    }
        //}
        
        //print
        for(int i = 0; i < k; i++){
            System.out.println(names2[i]);
        }
    }
    
}
