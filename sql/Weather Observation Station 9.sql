-- Weather Observation Station 9
-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT
  City
FROM 
  STATION
WHERE
  City REGEXP "^[^aeiou]" OR
  City REGEXP "^[^AEIOU]";
