-- Weather Observation Station 12
-- Query the list of CITY names from STATION that 
-- do not start with vowels and do not end with vowels. 
-- Your result cannot contain duplicates.

SELECT DISTINCT
  City
FROM 
  STATION
WHERE
  LEFT(City,1) NOT IN ('a','e','i','o','u') AND
  LEFT(City,1) NOT IN ('A','E','I','O','U') AND
  RIGHT(City,1) NOT IN ('a','e','i','o','u') AND
  RIGHT(City,1) NOT IN ('A','E','I','O','U');
