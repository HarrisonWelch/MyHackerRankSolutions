-- Population Census
-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

SELECT
    sum(CITY.Population)
FROM Country
    INNER JOIN CITY ON City.CountryCode = Country.Code
WHERE
    COUNTRY.Continent = 'Asia'
GROUP BY
    COUNTRY.Continent;
