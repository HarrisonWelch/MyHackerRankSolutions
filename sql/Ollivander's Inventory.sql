-- Ollivander's Inventory
-- Write a query to print the id, age, coins_needed, and power of the wands 
-- that Ron's interested in, sorted in order of descending power. If more
-- than one wand has same power, sort the result in order of descending age.

SELECT
    W1.ID,
    WP1.AGE,
    W1.COINS_NEEDED,
    W1.POWER
FROM
    WANDS W1
    JOIN WANDS_PROPERTY WP1 ON W1.CODE = WP1.CODE
WHERE
    WP1.IS_EVIL = 0
    AND W1.COINS_NEEDED = ( -- The trick here is the min price for a given age and power
        SELECT
            MIN(W2.COINS_NEEDED)
        FROM
            WANDS W2
            JOIN WANDS_PROPERTY WP2 ON W2.CODE = WP2.CODE
        WHERE
            W1.POWER = W2.POWER
            AND WP1.AGE = WP2.AGE
    )
ORDER BY
    W1.POWER DESC,
    WP1.AGE DESC
;
