import java.math.BigDecimal;
import java.util.*;
class Solution{

    public static void main(String []args){
        //Input
        Scanner sc= new Scanner(System.in);
        int n=sc.nextInt();
        String []s=new String[n+2];
        for(int i=0;i<n;i++){
            s[i]=sc.next();
        }
      	sc.close();

        //Write your code here
        String []s2 = new String[n];
        for (int i = 0; i < n; i++){
            s2[i] = s[i];
        }
        Arrays.sort(s2, Collections.reverseOrder(new Comparator<String>(){
            @Override
            public int compare(String a, String b){
                BigDecimal x = new BigDecimal(a);
                BigDecimal y = new BigDecimal(b);
                
                return x.compareTo(y);
            }
        }));

        for (int i = 0; i < n; i++){
            s[i] = s2[i];
        }

        // Arrays.sort(s, Collections.reverseOrder(new Comparator<String>() {
        //     @Override
        //     public int compare(String a1, String a2) {
        //         //convert to big decimal inside comparator
        //         //so permanent string values are never changed
        //         //aka you only use the BigDecimal values to 
        //         //compare the strings!
        //         BigDecimal a = new BigDecimal(a1);
        //         BigDecimal b = new BigDecimal(a2);
        //         return a.compareTo(b);
        //     }
        // }));
        //Output
        for(int i=0;i<n;i++)
        {
            System.out.println(s[i]);
        }
    }

}
