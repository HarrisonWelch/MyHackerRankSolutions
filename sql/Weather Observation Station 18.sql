-- Consider  and  to be two points on a 2D plane.

-- a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
-- b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
-- c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
-- d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points  and  and round it to a scale of 4 decimal places.

-- a = MIN(LAT_N)
-- b = MIN(LONG_W)
-- c = MAX(LAT_N)
-- d = MAX(LONG_W)

-- Manhattan Distance = |x1 - x2| + |y1 - y2|
-- The distance between two points measured along axes at right angles

SELECT
    ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)),4)
FROM
    STATION;
