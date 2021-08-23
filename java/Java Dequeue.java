import java.util.*;
public class test {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Deque deque = new ArrayDeque<>();
        int n = in.nextInt();
        int m = in.nextInt();

        HashSet<Integer> hashSet = new HashSet<Integer>();
        int highestUnique = -1;
        int thing = -1;
        for (int i = 0; i < n; i++) {
            int num = in.nextInt();
            
            deque.add(num);
            hashSet.add(num);
            
            // if the deque is of the subarray size of m
            if (deque.size() == m) {
                // Check max unique-ness
                if (hashSet.size() > highestUnique) {
                    highestUnique = hashSet.size();
                }
                // Remove front
                thing = (int) deque.removeFirst();
                
                // If there is not another copy in the deque
                if (!deque.contains(thing)) {
                    // remove it from the set
                    hashSet.remove(thing);
                }
            }
            
        }
        
        System.out.println(highestUnique);
    }
}

// Older slower solution
// import java.util.*;
// public class test {
//     public static void main(String[] args) {
//         Scanner in = new Scanner(System.in);
//         Deque deque = new ArrayDeque<>();
//         int n = in.nextInt();
//         int m = in.nextInt();

//         for (int i = 0; i < n; i++) {
//             int num = in.nextInt();
//             deque.addLast(num);
//         }
//         int highestUnique = -1;
//         HashSet<Integer> hashSet = new HashSet<Integer>();
//         ArrayList<Integer> subArray = new ArrayList<Integer>();
//         int thing = -1;
//         for (int i = 0; i < (m-1); i++) {
//             thing = (int) deque.pollFirst();
//             subArray.add(thing);
//         }
//         for (int i = 0; i < (n-m+1); i++) {
//             // for (int j = i; j < m; j++) {
//             // }
//             thing = (int) deque.pollFirst();
//             subArray.add(thing);
//             for (Integer integer : subArray){ 
//                 // System.out.println(integer);
//                 hashSet.add(integer);
//             }
//             if (hashSet.size() > highestUnique) {
//                 highestUnique = hashSet.size();
//             }
//             hashSet.clear();
//             subArray.remove(0);
//         }
//         System.out.println(highestUnique);
//     }
// }
