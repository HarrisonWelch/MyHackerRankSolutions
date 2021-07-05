-- Top Competitors
-- Write a query to print the respective hacker_id and name of hackers who 
-- achieved full scores for more than one challenge. Order your output in 
-- descending order by the total number of challenges in which the hacker 
-- earned a full score. If more than one hacker received full scores in 
-- same number of challenges, then sort them by ascending hacker_id.

SELECT
    *
FROM
    SUBMISSIONS
;


---- Get the submission that met or exceeded the score requirement
SELECT
    *
FROM
    SUBMISSIONS
    JOIN CHALLENGES ON SUBMISSIONS.CHALLENGE_ID = CHALLENGES.CHALLENGE_ID
    JOIN DIFFICULTY ON CHALLENGES.DIFFICULTY_LEVEL = DIFFICULTY.DIFFICULTY_LEVEL
WHERE
    SUBMISSIONS.SCORE >= DIFFICULTY.SCORE
ORDER BY
    SUBMISSIONS.SUBMISSION_ID
;

---- HACKER ID OF THOSE THAT COMPLETED >1 CHALLENEGE
SELECT
    SUBMISSIONS.HACKER_ID,
    COUNT(DISTINCT SUBMISSIONS.SUBMISSION_ID)
FROM
    SUBMISSIONS
    JOIN CHALLENGES ON SUBMISSIONS.CHALLENGE_ID = CHALLENGES.CHALLENGE_ID
    JOIN DIFFICULTY ON CHALLENGES.DIFFICULTY_LEVEL = DIFFICULTY.DIFFICULTY_LEVEL
WHERE
    SUBMISSIONS.SCORE >= DIFFICULTY.SCORE
GROUP BY
    SUBMISSIONS.HACKER_ID
HAVING
    COUNT(DISTINCT SUBMISSIONS.SUBMISSION_ID) > 1
;

----

-- Final assembly
SELECT
    HACKERS.HACKER_ID,
    HACKERS.NAME
FROM
    HACKERS
    JOIN (
    SELECT
        SUBMISSIONS.HACKER_ID,
        COUNT(SUBMISSIONS.SUBMISSION_ID) CNT
    FROM
        SUBMISSIONS
        JOIN CHALLENGES ON SUBMISSIONS.CHALLENGE_ID = CHALLENGES.CHALLENGE_ID
        JOIN DIFFICULTY ON CHALLENGES.DIFFICULTY_LEVEL = DIFFICULTY.DIFFICULTY_LEVEL
    WHERE
        SUBMISSIONS.SCORE = DIFFICULTY.SCORE
    GROUP BY
        SUBMISSIONS.HACKER_ID
    HAVING
        COUNT(DISTINCT SUBMISSIONS.SUBMISSION_ID) > 1) T1 ON HACKERS.HACKER_ID = T1.HACKER_ID
ORDER BY
    T1.CNT DESC,
    HACKERS.HACKER_ID
;


