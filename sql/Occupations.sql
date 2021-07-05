-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted
-- alphabetically and displayed underneath its corresponding Occupation.
-- The output column headers should be Doctor, Professor, Singer, and Actor, 
-- respectively.

SELECT
    *
FROM
    (SELECT * FROM OCCUPATIONS)
PIVOT
    (COUNT(NAME)
    FOR OCCUPATION
    IN ('Doctor', 'Professor', 'Singer', 'Actor'))
;

-- SELECT
--     name,
--     OCCUPATION
-- FROM
--     OCCUPATIONS;
