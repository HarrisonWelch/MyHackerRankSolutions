import java.util.*;

// Write your Checker class here
class Checker implements Comparator<Player>{
    public int compare(Player a, Player b) {
        if (a.score < b.score) {
            return 1; // reverse result for desc order
        }
        if (a.score > b.score) {
            return -1; // reverse result for desc order
        }
        // return the normal result
        if (a.name.compareTo(b.name) != 0) {
            return a.name.compareTo(b.name);
        }
        return 0; // They are the exact same
    }
}

class Player{
    String name;
    int score;
    
    Player(String name, int score){
        this.name = name;
        this.score = score;
    }
}

class Solution {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int n = scan.nextInt();

        Player[] player = new Player[n];
        Checker checker = new Checker();
        
        for(int i = 0; i < n; i++){
            player[i] = new Player(scan.next(), scan.nextInt());
        }
        scan.close();
     
        Arrays.sort(player, checker);
        for(int i = 0; i < player.length; i++){
            System.out.printf("%s %s\n", player[i].name, player[i].score);
        }
    }
}