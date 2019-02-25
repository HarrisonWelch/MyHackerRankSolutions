-- African Cities
-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT
  City.Name
FROM Country
  INNER JOIN CITY ON City.CountryCode = Country.Code
WHERE
  Country.Continent = 'Africa';