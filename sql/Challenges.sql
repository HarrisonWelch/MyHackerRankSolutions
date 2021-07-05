-- Challenges
-- Write a query to print the hacker_id, name, and the total number of
-- challenges created by each student. Sort your results by the total number of
-- challenges in descending order. If more than one student created the same 
-- number of challenges, then sort the result by hacker_id. If more than one
-- student created the same number of challenges and the count is less than the
-- maximum number of challenges created, then exclude those students from the
-- result.

SELECT
    HACKERS.HACKER_ID,
    HACKERS.NAME,
    COUNT(DISTINCT CHALLENGES.CHALLENGE_ID)
FROM
    HACKERS
    JOIN CHALLENGES ON HACKERS.HACKER_ID = CHALLENGES.HACKER_ID
GROUP BY
    HACKERS.HACKER_ID,
    HACKERS.NAME
HAVING
    -- Inclusion condition #1: Its the maximum --
    COUNT(DISTINCT CHALLENGES.CHALLENGE_ID) = (
        SELECT
            MAX(CNT)
        FROM (
            SELECT
                H2.HACKER_ID,
                COUNT(DISTINCT C2.CHALLENGE_ID) CNT
            FROM
                HACKERS H2
                JOIN CHALLENGES C2 ON H2.HACKER_ID = C2.HACKER_ID
            GROUP BY
                H2.HACKER_ID
        )
    )
    -- Inclusion condition #2: It's a non-duplicate count --
    -- The very strange one. Form a group of count numbers that only appear once --
    OR COUNT(DISTINCT CHALLENGES.CHALLENGE_ID) IN (
        SELECT
            TO_NUMBER(CNT_CNT)
        FROM (
            SELECT
                TO_CHAR(CNT) CNT_CNT,
                COUNT(TO_CHAR(CNT))
            FROM (
                SELECT
                    H2.HACKER_ID,
                    COUNT(DISTINCT C2.CHALLENGE_ID) CNT
                FROM
                    HACKERS H2
                    JOIN CHALLENGES C2 ON H2.HACKER_ID = C2.HACKER_ID
                GROUP BY
                    H2.HACKER_ID
            )
            GROUP BY
                TO_CHAR(CNT)
            HAVING
                COUNT(TO_CHAR(CNT)) = 1
        )
    )
ORDER BY
    COUNT(DISTINCT CHALLENGES.CHALLENGE_ID) DESC,
    HACKERS.HACKER_ID ASC
;
