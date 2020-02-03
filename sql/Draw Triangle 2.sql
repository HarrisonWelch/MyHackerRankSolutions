-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

-- * * * * * 
-- * * * * 
-- * * * 
-- * * 
-- *

-- Write a query to print the pattern P(20).

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT
    RPAD('*',x,' *')
FROM
    (SELECT 
        LEVEL x 
     FROM DUAL 
     CONNECT BY 
        LEVEL <= 40)
WHERE
    MOD(x,2) = 0;
