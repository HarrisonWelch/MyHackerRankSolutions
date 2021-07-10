/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT
    listagg(t3.n, '&') within group (order by t3.n) -- <== combine the numbers in a list
FROM
    (SELECT level n from dual connect by level <= 1000) t3 -- <== Get the numbers 1 to 1000
WHERE
    t3.n NOT IN ( -- <== If not in the list of composite numbers
        SELECT DISTINCT
            t1.n
        FROM
            (SELECT level n from dual connect by level <= 1000) t1
            JOIN (SELECT level n from dual connect by level <= 1000) t2
                ON t2.n > 1
                AND t1.n > t2.n
                AND t1.n / t2.n = trunc(t1.n / t2.n) -- <== Call up two tables of 1 to 1000, if the join is made, its composite (inverted later on)
    )
    AND t3.n <> 1 -- <== 1 is not prime by definition
    AND t3.n <> 0 -- <== 0 is not prime by definition
;
