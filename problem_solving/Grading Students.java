// HackerLand University has the following grading policy:

// Every student receives a grade in the inclusive range from 0 to 100.
// Any grade less than 40 is a failing grade.
// Sam is a professor at the university and likes to round each student's  
// according to these rules:

// If the difference between the  and the next multiple of grade is less than , round
// up to the next multiple of 5.
// If the value of grade is less than 38, no rounding occurs as the result will still
// be a failing grade.
// For example, grade = 84 will be rounded to 85 but grade = 29 will not be rounded because the 
// rounding would result in a number that is less than 40.

// Given the initial value of grade for each of Sam's n students, write code to 
// automate the rounding process.

// Complete the function gradingStudents in the editor below. It should return 
// an integer array consisting of rounded grades.

// gradingStudents has the following parameter(s):

// grades: an array of integers representing grades before rounding

import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.function.*;
import java.util.regex.*;
import java.util.stream.*;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

class Result {

    /*
     * Complete the 'gradingStudents' function below.
     *
     * The function is expected to return an INTEGER_ARRAY.
     * The function accepts INTEGER_ARRAY grades as parameter.
     */

    public static List<Integer> gradingStudents(List<Integer> grades) {
    // Write your code here
        ArrayList<Integer> roundedGrades = new ArrayList<Integer>();
        int start = 0;
        int closestMul5 = 0;
        for (int i = 0; i < grades.size(); i++) {
            // System.out.println("A");
            start = grades.get(i);
            if (start < 38){
                roundedGrades.add(start);
            } else {

                for (int j = 0; j < 6; j++) {
                    if ((start + j) % 5 == 0){
                        closestMul5 = start + j;
                    }
                }
                if (closestMul5 - start < 3) {
                    roundedGrades.add(closestMul5);
                } else {

                    roundedGrades.add(start);
                }
            }
        }
        return roundedGrades;
    }

}

public class Solution {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        int gradesCount = Integer.parseInt(bufferedReader.readLine().trim());

        List<Integer> grades = IntStream.range(0, gradesCount).mapToObj(i -> {
            try {
                return bufferedReader.readLine().replaceAll("\\s+$", "");
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        })
            .map(String::trim)
            .map(Integer::parseInt)
            .collect(toList());

        List<Integer> result = Result.gradingStudents(grades);

        bufferedWriter.write(
            result.stream()
                .map(Object::toString)
                .collect(joining("\n"))
            + "\n"
        );

        bufferedReader.close();
        bufferedWriter.close();
    }
}
