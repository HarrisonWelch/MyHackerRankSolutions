// https://www.hackerrank.com/challenges/30-binary-trees/problem

import java.io.*;
import java.util.*;
class Node{
    Node left,right;
    int data;
    Node(int data){
        this.data=data;
        left=right=null;
    }
}
class Solution{

	static void levelOrder(Node root){
      //Write your code here
        Vector<Node> vec = new Vector<Node>();
        Node curr = root;
        vec.add(curr);
        
        while(!vec.isEmpty()){
            System.out.print(vec.elementAt(0).data + " ");
            if(vec.elementAt(0).left != null){
                vec.add(vec.elementAt(0).left);
            }
            if(vec.elementAt(0).right != null){
                vec.add(vec.elementAt(0).right);
            }
            vec.remove(0);
        }
        
        
    }
	public static Node insert(Node root,int data){
        if(root==null){
            return new Node(data);
        }
        else{
            Node cur;
            if(data<=root.data){
                cur=insert(root.left,data);
                root.left=cur;
            }
            else{
                cur=insert(root.right,data);
                root.right=cur;
            }
            return root;
        }
    }
    public static void main(String args[]){
            Scanner sc=new Scanner(System.in);
            int T=sc.nextInt();
            Node root=null;
            while(T-->0){
                int data=sc.nextInt();
                root=insert(root,data);
            }
            levelOrder(root);
        }	
}
