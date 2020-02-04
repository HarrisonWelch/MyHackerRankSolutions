/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT
    N, 
    P,
    (
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN P IN (SELECT N FROM BST) THEN 'Leaf'
        ELSE 'Inner'
    END)
FROM
    BST
START WITH
    P IS NULL
CONNECT BY
    P = prior N
-- ORDER BY
--     N ASC;