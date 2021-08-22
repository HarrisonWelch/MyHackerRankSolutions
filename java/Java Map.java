//Complete this code or write your own from scratch
import java.util.*;
import java.io.*;

class Solution{
	public static void main(String []argh)
	{
		Scanner in = new Scanner(System.in);
		int n=in.nextInt();
		in.nextLine();
        HashMap<String, Integer> map = new HashMap<String, Integer>();
		for (int i = 0; i < n; i++) {
			String name=in.nextLine();
			int phone=in.nextInt();
            map.put(name, phone);
			in.nextLine();
		}
		while (in.hasNext()) {
			String s=in.nextLine();
            System.out.println((map.get(s) == null ? "Not found" : s + "=" + map.get(s)));
		}
	}
}
