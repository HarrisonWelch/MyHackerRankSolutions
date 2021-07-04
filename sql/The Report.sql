-- You are given two tables: Students and Grades. Students contains three 
-- columns ID, Name and Marks.

-- Grades contains the following data:

-- Ketty gives Eve a task to generate a report containing three columns: Name, 
-- Grade and Mark. Ketty doesn't want the NAMES of those students who received a
--  grade lower than 8. The report must be in descending order by grade -- i.e. 
-- higher grades are entered first. If there is more than one student with the 
-- same grade (8-10) assigned to them, order those particular students by their 
-- name alphabetically. Finally, if the grade is lower than 8, use "NULL" as 
-- their name and list them by their grades in descending order. If there is 
-- more than one student with the same grade (1-7) assigned to them, order those 
-- particular students by their marks in ascending order.

-- Write a query to help Eve.

SELECT
    (CASE WHEN GRADES.GRADE >= 8 THEN STUDENTS.NAME ELSE NULL END),
    GRADES.GRADE,
    STUDENTS.MARKS
FROM
    STUDENTS
    JOIN GRADES ON STUDENTS.MARKS BETWEEN GRADES.MIN_MARK AND GRADES.MAX_MARK
ORDER BY
    GRADES.GRADE DESC,
    (CASE
        WHEN GRADES.GRADE >= 8 THEN TO_CHAR(STUDENTS.NAME)
        ELSE TO_CHAR(STUDENTS.MARKS)
    END)
;

----

SELECT
    (CASE WHEN GRADES.GRADE >= 8 THEN STUDENTS.NAME ELSE NULL END),
    GRADES.GRADE,
    STUDENTS.MARKS
FROM
    STUDENTS
    JOIN GRADES ON (CASE
                        WHEN STUDENTS.MARKS >= 0 AND STUDENTS.MARKS <= 9 THEN 1
                        WHEN STUDENTS.MARKS >= 10 AND STUDENTS.MARKS <= 19 THEN 2
                        WHEN STUDENTS.MARKS >= 20 AND STUDENTS.MARKS <= 29 THEN 3
                        WHEN STUDENTS.MARKS >= 30 AND STUDENTS.MARKS <= 39 THEN 4
                        WHEN STUDENTS.MARKS >= 40 AND STUDENTS.MARKS <= 49 THEN 5
                        WHEN STUDENTS.MARKS >= 50 AND STUDENTS.MARKS <= 59 THEN 6
                        WHEN STUDENTS.MARKS >= 60 AND STUDENTS.MARKS <= 69 THEN 7
                        WHEN STUDENTS.MARKS >= 70 AND STUDENTS.MARKS <= 79 THEN 8
                        WHEN STUDENTS.MARKS >= 80 AND STUDENTS.MARKS <= 89 THEN 9
                        WHEN STUDENTS.MARKS >= 90 THEN 10
                        ELSE -1
                   END) = GRADES.GRADE
ORDER BY
    GRADES.GRADE DESC,
    (CASE
        WHEN GRADES.GRADE >= 8 THEN TO_CHAR(STUDENTS.NAME)
        ELSE TO_CHAR(STUDENTS.MARKS)
    END)
;
