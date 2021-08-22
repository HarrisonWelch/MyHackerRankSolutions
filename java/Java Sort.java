import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
// import java.util.PriorityQueue;
import java.util.*;
import java.lang.*;
import java.io.*;
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
                // System.out.println("compare called");
                if ((a.getCGPA() - b.getCGPA()) < 0) {
                    return 1;
                }
                if ((a.getCGPA() - b.getCGPA()) > 0) {
                    return -1;
                }
                if (a.getName().compareTo(b.getName()) != 0) {
                    return a.getName().compareTo(b.getName());
                }
                
                return a.getId() - b.getId();
            }
        });
        String[] lineTokens;
        String command = "";
        for (int i = 0; i < events.size(); i++) {
            lineTokens = events.get(i).split(" ");
            command = lineTokens[0];
            switch (command) {
                case "ENTER":
                    priorityQueue.add(new Student(
                        Integer.parseInt(lineTokens[3]),
                        lineTokens[1],
                        Double.parseDouble(lineTokens[2])));
                    // priorityQueue.peek();
                    // printPriorityQueue(priorityQueue);
                    break;
                case "SERVED":
                    // System.out.println("it.next() = " + it.next().getName());
                    priorityQueue.poll();
                    // System.out.println("SERVED " + student.getName());
                    break;
                default:
                    System.out.println("Something broke");
            }
        }
        while(!priorityQueue.isEmpty()) {
            list.add(priorityQueue.poll());
        }
        return list;
    }
    
    public void printPriorityQueue(PriorityQueue<Student> students) {
        System.out.print("Queue: ");
        for (Student s : students) {
            System.out.print(s.getName() + " ");
        }
        System.out.println("");
    }
}

