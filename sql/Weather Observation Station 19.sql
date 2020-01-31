-- Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

-- Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.

-- The Euclidean distance between points p and q is the length of the line segment connecting them

SELECT
    ROUND(SQRT(POWER(MIN(LAT_N) - MAX(LAT_N),2) + POWER(MIN(LONG_W) - MAX(LONG_W), 2)),4)
FROM
    STATION;
