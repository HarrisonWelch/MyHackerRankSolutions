-- Revising the Select Query II.sql
-- Query the NAME field for all American cities in the CITY table with 
-- populations larger than 120000. The CountryCode for America is USA.

SELECT
    Name
FROM
    CITY
WHERE
    POPULATION > 120000 AND
    CountryCode = 'USA';
