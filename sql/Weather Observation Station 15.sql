-- Query the Western Longitude (LONG_W) for the largest Northern Latitude 
-- (LAT_N) in STATION that is less than 137.2345. Round your answer to decimal 
-- places.

SELECT ROUND(MAX(LONG_W),4) FROM
(
    SELECT
        *
    FROM
        STATION
    WHERE
        LAT_N < 137.2345
    ORDER BY
        LAT_N DESC
)
WHERE ROWNUM=1;
