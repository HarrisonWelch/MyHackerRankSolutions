/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

-- Write a query to print the contest_id, hacker_id, name, and the sums of-
-- total_submissions, total_accepted_submissions, total_views, and
-- total_unique_views for each contest sorted by contest_id. Exclude the contest
-- from the result if all four sums are 0.

SELECT
    *
FROM (
    SELECT
        cts.CONTEST_ID,
        cts.HACKER_ID,
        cts.NAME,
        NVL((
            SELECT
                SUM(SUBMISSION_STATS.TOTAL_SUBMISSIONS)
            FROM
                SUBMISSION_STATS
                JOIN CHALLENGES ON SUBMISSION_STATS.CHALLENGE_ID = CHALLENGES.CHALLENGE_ID
                JOIN COLLEGES ON CHALLENGES.COLLEGE_ID = COLLEGES.COLLEGE_ID
            WHERE
                COLLEGES.CONTEST_ID = cts.CONTEST_ID
        ), 0) TOTAL_SUBMISSIONS,
        NVL((
            SELECT
                SUM(SUBMISSION_STATS.TOTAL_ACCEPTED_SUBMISSIONS)
            FROM
                SUBMISSION_STATS
                JOIN CHALLENGES ON SUBMISSION_STATS.CHALLENGE_ID = CHALLENGES.CHALLENGE_ID
                JOIN COLLEGES ON CHALLENGES.COLLEGE_ID = COLLEGES.COLLEGE_ID
            WHERE
                COLLEGES.CONTEST_ID = cts.CONTEST_ID
        ), 0) TOTAL_ACCEPTED_SUBMISSIONS,
        NVL((
            SELECT
                SUM(VIEW_STATS.TOTAL_VIEWS)
            FROM
                VIEW_STATS
                JOIN CHALLENGES ON VIEW_STATS.CHALLENGE_ID = CHALLENGES.CHALLENGE_ID
                JOIN COLLEGES ON CHALLENGES.COLLEGE_ID = COLLEGES.COLLEGE_ID
            WHERE
                COLLEGES.CONTEST_ID = cts.CONTEST_ID
        ), 0) TOTAL_VIEWS,
        NVL((
            SELECT
                SUM(VIEW_STATS.TOTAL_UNIQUE_VIEWS)
            FROM
                VIEW_STATS
                JOIN CHALLENGES ON VIEW_STATS.CHALLENGE_ID = CHALLENGES.CHALLENGE_ID
                JOIN COLLEGES ON CHALLENGES.COLLEGE_ID = COLLEGES.COLLEGE_ID
            WHERE
                COLLEGES.CONTEST_ID = cts.CONTEST_ID
        ), 0) TOTAL_UNIQUE_VIEWS
    FROM
        CONTESTS cts)
WHERE
    TOTAL_SUBMISSIONS <> 0
    AND TOTAL_ACCEPTED_SUBMISSIONS <> 0
    AND TOTAL_VIEWS <> 0
    AND TOTAL_UNIQUE_VIEWS <> 0
;
