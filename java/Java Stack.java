import java.util.*;
class Solution{
	
	public static void main(String []argh)
	{
		Scanner sc = new Scanner(System.in);
		Stack<Character> stack = new Stack<Character>();
        char c = '~';
        boolean isBroken = false;
        
		while (sc.hasNext()) {
			String input=sc.next();
            //Complete the code
            for (int i = 0; i < input.length(); i++) {
                // System.out.print("stuff");
                c = input.charAt(i);
                // System.out.println("Looking at " + c);
                switch (c) {
                    case '{':
                    case '[':
                    case '(':
                        stack.push(c);
                        break;
                    case '}':
                        if (stack.isEmpty()) {
                            isBroken = true;
                        }
                        if (!stack.isEmpty() && stack.peek().equals('{')) {
                            c = stack.pop();
                            // System.out.println("Popped " + c);
                        }
                        break;
                    case ']':
                        if (stack.isEmpty()) {
                            isBroken = true;
                        }
                        if (!stack.isEmpty() && stack.peek().equals('[')) {
                            c = stack.pop();
                            // System.out.println("Popped " + c);
                        }
                        break;
                    case ')':
                        if (stack.isEmpty()) {
                            isBroken = true;
                        }
                        // System.out.println("Seeing " + c + ", Peek = " + stack.peek());
                        if (!stack.isEmpty() && stack.peek().equals('(')) {
                            c = stack.pop();
                            // System.out.println("Popped " + c);
                        }
                        break;
                    default:
                        // System.out.println("Something broke");
                }
            }
            // printStack(stack);
            System.out.println(stack.size() == 0 && !isBroken);
            stack.clear();
            isBroken = false;
		}
		
	}
    
    public static void printStack(Stack stack) {
        for (int i = 0; i < stack.size(); i++) {
            System.out.print(stack.get(i));
        }
    }
}
