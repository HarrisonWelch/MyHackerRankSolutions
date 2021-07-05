-- Write a query to output the names of those students whose best friends got offered a higher salary than them. 
-- Names must be ordered by the salary amount offered to the best friends.
-- It is guaranteed that no two students got same salary offer.

-- Solution #1

SELECT
    STUDENTS.NAME
FROM
    STUDENTS
    JOIN PACKAGES ON STUDENTS.ID = PACKAGES.ID
    JOIN FRIENDS ON STUDENTS.ID = FRIENDS.ID
    JOIN STUDENTS S2 ON FRIENDS.FRIEND_ID = S2.ID
    JOIN PACKAGES P2 ON S2.ID = P2.ID
WHERE
    PACKAGES.SALARY < P2.SALARY
ORDER BY
    P2.SALARY
;

----

-- Solution #2
-- less joins, more speed, less memory

SELECT
    STUDENTS.NAME
FROM
    STUDENTS
    JOIN FRIENDS ON STUDENTS.ID = FRIENDS.ID
    JOIN PACKAGES P1 ON STUDENTS.ID = P1.ID
    JOIN PACKAGES P2 ON FRIENDS.FRIEND_ID = P2.ID
WHERE
    P1.SALARY < P2.SALARY
ORDER BY
    P2.SALARY
;
