-- Weather Observation Station 10
-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT
  City
FROM 
  STATION
WHERE
  RIGHT(City,1) NOT IN ('a','e','i','o','u') OR
  RIGHT(City,1) NOT IN ('A','E','I','O','U');
