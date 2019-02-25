-- Asian Population

-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT
  sum(CITY.Population)
FROM Country
  INNER JOIN CITY ON City.CountryCode = Country.Code
WHERE
  COUNTRY.Continent = 'Asia'
GROUP BY
  COUNTRY.Continent;
