import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.PriorityQueue;
/*
 * Create the Student and Priorities classes here.
 */
class Student {
    int id;
    String name;
    double cgpa;
    
    Student(int id, String name, double cgpa) {
        this.id = id;
        this.name = name;
        this.cgpa = cgpa;
    }
    
    public int getId() {
        return this.id;
    }
    
    public String getName() {
        return this.name;
    }
    
    public double getCGPA() {
        return this.cgpa;
    }
}

class Priorities {
    public List<Student> getStudents(List<String> events) {
        List<Student> list = new ArrayList<Student>();
        PriorityQueue<Student> priorityQueue = new PriorityQueue<Student>(1000, new Comparator<Student>() {
            public int compare(Student a, Student b) {
                if (a.getCGPA() < 0) {
                    return 1;
                }
                if (a.getCGPA() > 0) {
                    return -1;
                }
                
                return 0;
            }
        });
        return list;
    }
}


public class Solution {
    private final static Scanner scan = new Scanner(System.in);
    private final static Priorities priorities = new Priorities();
    
    public static void main(String[] args) {
        int totalEvents = Integer.parseInt(scan.nextLine());    
        List<String> events = new ArrayList<>();
        
        while (totalEvents-- != 0) {
            String event = scan.nextLine();
            events.add(event);
        }
        
        List<Student> students = priorities.getStudents(events);
        
        if (students.isEmpty()) {
            System.out.println("EMPTY");
        } else {
            for (Student st: students) {
                System.out.println(st.getName());
            }
        }
    }
}