/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT DISTINCT
    T1.X,
    T1.Y
FROM
    (SELECT F1.X, F1.Y, ROWNUM rn FROM FUNCTIONS F1 ORDER BY F1.X, F1.Y) T1
    JOIN (SELECT F2.X, F2.Y, ROWNUM rn FROM FUNCTIONS F2 ORDER BY F2.X, F2.Y) T2
    ON T1.rn <> T2.rn
    AND T1.X = T2.Y
    AND T1.Y = T2.X
    AND T1.X <= T1.Y
ORDER BY
    T1.X,
    T1.Y
;
