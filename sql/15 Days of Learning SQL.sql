/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

-- Write a query to print total number of unique hackers who made at least 1
-- submission each day (starting on the first day of the contest), and find the
-- hacker_id and name of the hacker who made maximum number of submissions each
-- day. If more than one such hacker has a maximum number of submissions, print
-- the lowest hacker_id. The query should print this information for each day of
-- the contest, sorted by the date.

SELECT
    *
FROM
    HACKERS
    JOIN SUBMISSIONS ON HACKERS.HACKER_ID = SUBMISSIONS.HACKER_ID
;

SELECT
    SUBMISSIONS.SUBMISSION_DATE,
    SUBMISSIONS.HACKER_ID,
    COUNT(DISTINCT SUBMISSIONS.SUBMISSION_ID)
FROM
    SUBMISSIONS
GROUP BY
    SUBMISSIONS.SUBMISSION_DATE,
    SUBMISSIONS.HACKER_ID
;

SELECT
    SUBMISSION_DATE,
    MAX(cnt)
FROM (
    SELECT
        SUBMISSIONS.SUBMISSION_DATE,
        SUBMISSIONS.HACKER_ID,
        COUNT(DISTINCT SUBMISSIONS.SUBMISSION_ID) cnt
    FROM
        SUBMISSIONS
    GROUP BY
        SUBMISSIONS.SUBMISSION_DATE,
        SUBMISSIONS.HACKER_ID)
GROUP BY
    SUBMISSION_DATE
ORDER BY
    SUBMISSION_DATE
;

SELECT
    SUBMISSIONS.SUBMISSION_DATE,
    SUBMISSIONS.HACKER_ID,
    COUNT(DISTINCT SUBMISSIONS.SUBMISSION_ID) cnt
FROM
    SUBMISSIONS
GROUP BY
    SUBMISSIONS.SUBMISSION_DATE,
    SUBMISSIONS.HACKER_ID
ORDER BY
    SUBMISSIONS.SUBMISSION_DATE ASC,
    CAST(SUBMISSIONS.HACKER_ID AS INTEGER) ASC
;

SELECT
    SUBMISSIONS.SUBMISSION_DATE,
    SUBMISSIONS.HACKER_ID,
    COUNT(DISTINCT SUBMISSIONS.SUBMISSION_ID) cnt
FROM
    SUBMISSIONS
GROUP BY
    SUBMISSIONS.SUBMISSION_DATE,
    SUBMISSIONS.HACKER_ID
ORDER BY
    SUBMISSIONS.SUBMISSION_DATE ASC,
    CAST(SUBMISSIONS.HACKER_ID AS INTEGER) ASC
;

----

SELECT
    T1.SUBMISSION_DATE,
    MAX(CNT)
FROM (
    SELECT
        SUBMISSIONS.SUBMISSION_DATE,
        SUBMISSIONS.HACKER_ID,
        COUNT(DISTINCT SUBMISSIONS.SUBMISSION_ID) cnt
    FROM
        SUBMISSIONS
    GROUP BY
        SUBMISSIONS.SUBMISSION_DATE,
        SUBMISSIONS.HACKER_ID
    ORDER BY
        SUBMISSIONS.SUBMISSION_DATE ASC,
        CAST(SUBMISSIONS.HACKER_ID AS INTEGER) ASC) T1
GROUP BY
    T1.SUBMISSION_DATE
;


SELECT
    S1.SUBMISSION_DATE,
    (SELECT
        MAX(COUNT(DISTINCT S2.SUBMISSION_ID))
    FROM
        SUBMISSIONS S2
    WHERE
        S2.SUBMISSION_DATE = S1.SUBMISSION_DATE)
FROM
    SUBMISSIONS S1
GROUP BY
    S1.SUBMISSION_DATE
ORDER BY
    S1.SUBMISSION_DATE
;


SELECT
    *
FROM (
    SELECT
        SUBMISSIONS.SUBMISSION_DATE,
        SUBMISSIONS.HACKER_ID,
        COUNT(DISTINCT SUBMISSIONS.SUBMISSION_ID) cnt
    FROM
        SUBMISSIONS
    WHERE
        SUBMISSION_DATE = '2016-03-01'
    GROUP BY
        SUBMISSIONS.SUBMISSION_DATE,
        SUBMISSIONS.HACKER_ID
    ORDER BY
        COUNT(DISTINCT SUBMISSIONS.SUBMISSION_ID) DESC,
        SUBMISSIONS.HACKER_ID ASC)
WHERE
    ROWNUM = 1
;

SELECT
    S1.SUBMISSION_DATE,
    (
        SELECT
            cnt
        FROM (
            SELECT
                S2.SUBMISSION_DATE,
                S2.HACKER_ID,
                COUNT(DISTINCT S2.SUBMISSION_ID) cnt
            FROM
                SUBMISSIONS S2
            WHERE
                S2.SUBMISSION_DATE = S1.SUBMISSION_DATE
            GROUP BY
                S2.SUBMISSION_DATE,
                S2.HACKER_ID
            ORDER BY
                COUNT(DISTINCT S2.SUBMISSION_ID) DESC,
                S2.HACKER_ID ASC)
        WHERE
            ROWNUM = 1
    )
FROM
    SUBMISSIONS S1
GROUP BY
    S1.SUBMISSION_DATE
ORDER BY
    S1.SUBMISSION_DATE
;

SELECT
    SUBMISSION_DATE,
    max(cnt)
FROM (
    SELECT
        S2.SUBMISSION_DATE,
        S2.HACKER_ID,
        COUNT(DISTINCT S2.SUBMISSION_ID) cnt
    FROM
        SUBMISSIONS S2
    GROUP BY
        S2.SUBMISSION_DATE,
        S2.HACKER_ID)
GROUP BY
    SUBMISSION_DATE
;

SELECT
    S2.SUBMISSION_DATE,
    S2.HACKER_ID,
    COUNT(DISTINCT S2.SUBMISSION_ID) cnt
FROM
    SUBMISSIONS S2
GROUP BY
    S2.SUBMISSION_DATE,
    S2.HACKER_ID
ORDER BY
    S2.SUBMISSION_DATE,
    S2.HACKER_ID
;

SELECT
    cnt_by_user_date.SUBMISSION_DATE,
    cnt_by_date.cnt,
    cnt_by_user_date.HACKER_ID
FROM (
    SELECT
        S2.SUBMISSION_DATE,
        S2.HACKER_ID,
        COUNT(DISTINCT S2.SUBMISSION_ID) cnt
    FROM
        SUBMISSIONS S2
    GROUP BY
        S2.SUBMISSION_DATE,
        S2.HACKER_ID
    ORDER BY
        S2.SUBMISSION_DATE,
        S2.HACKER_ID) cnt_by_user_date
    JOIN (
        SELECT
            SUBMISSION_DATE,
            max(cnt) cnt
        FROM (
            SELECT
                S2.SUBMISSION_DATE,
                S2.HACKER_ID,
                COUNT(DISTINCT S2.SUBMISSION_ID) cnt
            FROM
                SUBMISSIONS S2
            GROUP BY
                S2.SUBMISSION_DATE,
                S2.HACKER_ID)
        GROUP BY
            SUBMISSION_DATE
    ) cnt_by_date
    ON cnt_by_user_date.SUBMISSION_DATE = cnt_by_date.SUBMISSION_DATE
    AND cnt_by_user_date.cnt = cnt_by_date.cnt
;

SELECT
    date_cnt_hacker.SUBMISSION_DATE,
    date_cnt_hacker.cnt,
    MIN(date_cnt_hacker.HACKER_ID)
FROM (
    SELECT
        cnt_by_user_date.SUBMISSION_DATE,
        cnt_by_date.cnt,
        cnt_by_user_date.HACKER_ID
    FROM (
        SELECT
            S2.SUBMISSION_DATE,
            S2.HACKER_ID,
            COUNT(DISTINCT S2.SUBMISSION_ID) cnt
        FROM
            SUBMISSIONS S2
        GROUP BY
            S2.SUBMISSION_DATE,
            S2.HACKER_ID
        ORDER BY
            S2.SUBMISSION_DATE,
            S2.HACKER_ID) cnt_by_user_date
        JOIN (
            SELECT
                SUBMISSION_DATE,
                max(cnt) cnt
            FROM (
                SELECT
                    S2.SUBMISSION_DATE,
                    S2.HACKER_ID,
                    COUNT(DISTINCT S2.SUBMISSION_ID) cnt
                FROM
                    SUBMISSIONS S2
                GROUP BY
                    S2.SUBMISSION_DATE,
                    S2.HACKER_ID)
            GROUP BY
                SUBMISSION_DATE
        ) cnt_by_date
        ON cnt_by_user_date.SUBMISSION_DATE = cnt_by_date.SUBMISSION_DATE
        AND cnt_by_user_date.cnt = cnt_by_date.cnt) date_cnt_hacker
GROUP BY
    date_cnt_hacker.SUBMISSION_DATE,
    date_cnt_hacker.cnt
;

SELECT
    date_cnt_min_hacker.SUBMISSION_DATE,
    date_cnt_min_hacker.cnt,
    HACKERS.HACKER_ID
    HACKERS.NAME
FROM (
    SELECT
        date_cnt_hacker.SUBMISSION_DATE,
        date_cnt_hacker.cnt,
        MIN(date_cnt_hacker.HACKER_ID) HACKER_ID
    FROM (
        SELECT
            cnt_by_user_date.SUBMISSION_DATE,
            cnt_by_date.cnt,
            cnt_by_user_date.HACKER_ID
        FROM (
            SELECT
                S2.SUBMISSION_DATE,
                S2.HACKER_ID,
                COUNT(DISTINCT S2.SUBMISSION_ID) cnt
            FROM
                SUBMISSIONS S2
            GROUP BY
                S2.SUBMISSION_DATE,
                S2.HACKER_ID
            ORDER BY
                S2.SUBMISSION_DATE,
                S2.HACKER_ID) cnt_by_user_date
            JOIN (
                SELECT
                    SUBMISSION_DATE,
                    max(cnt) cnt
                FROM (
                    SELECT
                        S2.SUBMISSION_DATE,
                        S2.HACKER_ID,
                        COUNT(DISTINCT S2.SUBMISSION_ID) cnt
                    FROM
                        SUBMISSIONS S2
                    GROUP BY
                        S2.SUBMISSION_DATE,
                        S2.HACKER_ID)
                GROUP BY
                    SUBMISSION_DATE
            ) cnt_by_date
            ON cnt_by_user_date.SUBMISSION_DATE = cnt_by_date.SUBMISSION_DATE
            AND cnt_by_user_date.cnt = cnt_by_date.cnt) date_cnt_hacker
    GROUP BY
        date_cnt_hacker.SUBMISSION_DATE,
        date_cnt_hacker.cnt) date_cnt_min_hacker
    JOIN HACKERS ON date_cnt_min_hacker.HACKER_ID = HACKERS.HACKER_ID
;

SELECT
    date_cnt_min_hacker.SUBMISSION_DATE,
    date_cnt_min_hacker.cnt,
    HACKERS.HACKER_ID,
    HACKERS.NAME
FROM (
    SELECT
        date_cnt_hacker.SUBMISSION_DATE,
        date_cnt_hacker.cnt,
        MIN(date_cnt_hacker.HACKER_ID) HACKER_ID
    FROM (
        SELECT
            cnt_by_user_date.SUBMISSION_DATE,
            cnt_by_date.cnt,
            cnt_by_user_date.HACKER_ID
        FROM (
            SELECT
                S2.SUBMISSION_DATE,
                S2.HACKER_ID,
                COUNT(DISTINCT S2.SUBMISSION_ID) cnt
            FROM
                SUBMISSIONS S2
            GROUP BY
                S2.SUBMISSION_DATE,
                S2.HACKER_ID
            ORDER BY
                S2.SUBMISSION_DATE,
                S2.HACKER_ID) cnt_by_user_date
            JOIN (
                SELECT
                    SUBMISSION_DATE,
                    max(cnt) cnt
                FROM (
                    SELECT
                        S2.SUBMISSION_DATE,
                        S2.HACKER_ID,
                        COUNT(DISTINCT S2.SUBMISSION_ID) cnt
                    FROM
                        SUBMISSIONS S2
                    GROUP BY
                        S2.SUBMISSION_DATE,
                        S2.HACKER_ID)
                GROUP BY
                    SUBMISSION_DATE
            ) cnt_by_date
            ON cnt_by_user_date.SUBMISSION_DATE = cnt_by_date.SUBMISSION_DATE
            AND cnt_by_user_date.cnt = cnt_by_date.cnt) date_cnt_hacker
    GROUP BY
        date_cnt_hacker.SUBMISSION_DATE,
        date_cnt_hacker.cnt) date_cnt_min_hacker
    JOIN HACKERS ON date_cnt_min_hacker.HACKER_ID = HACKERS.HACKER_ID
ORDER BY
    date_cnt_min_hacker.SUBMISSION_DATE
;


SELECT
    HACKERS.HACKER_ID
FROM
    HACKERS
    LEFT JOIN SUBMISSIONS ON HACKERS.HACKER_ID = SUBMISSIONS.HACKER_ID
GROUP BY
    HACKERS.HACKER_ID
HAVING
    COUNT(DISTINCT SUBMISSIONS.SUBMISSION_DATE) = (SELECT COUNT(DISTINCT SUBMISSIONS.SUBMISSION_DATE) FROM SUBMISSIONS)
;

SELECT
    date_cnt_min_hacker.SUBMISSION_DATE,
    date_cnt_min_hacker.cnt,
    HACKERS.HACKER_ID,
    HACKERS.NAME
FROM (
    SELECT
        date_cnt_hacker.SUBMISSION_DATE,
        date_cnt_hacker.cnt,
        MIN(date_cnt_hacker.HACKER_ID) HACKER_ID
    FROM (
        SELECT
            cnt_by_user_date.SUBMISSION_DATE,
            cnt_by_date.cnt,
            cnt_by_user_date.HACKER_ID
        FROM (
            SELECT
                S2.SUBMISSION_DATE,
                S2.HACKER_ID,
                COUNT(DISTINCT S2.SUBMISSION_ID) cnt
            FROM
                SUBMISSIONS S2
            GROUP BY
                S2.SUBMISSION_DATE,
                S2.HACKER_ID
            ORDER BY
                S2.SUBMISSION_DATE,
                S2.HACKER_ID) cnt_by_user_date
            JOIN (
                SELECT
                    SUBMISSION_DATE,
                    max(cnt) cnt
                FROM (
                    SELECT
                        S2.SUBMISSION_DATE,
                        S2.HACKER_ID,
                        COUNT(DISTINCT S2.SUBMISSION_ID) cnt
                    FROM
                        SUBMISSIONS S2
                    WHERE
                        S2.HACKER_ID IN (
                            SELECT
                                HACKERS.HACKER_ID
                            FROM
                                HACKERS
                                LEFT JOIN SUBMISSIONS ON HACKERS.HACKER_ID = SUBMISSIONS.HACKER_ID
                            GROUP BY
                                HACKERS.HACKER_ID
                            HAVING
                                COUNT(DISTINCT SUBMISSIONS.SUBMISSION_DATE) = (SELECT COUNT(DISTINCT SUBMISSIONS.SUBMISSION_DATE) FROM SUBMISSIONS)
                        )
                    GROUP BY
                        S2.SUBMISSION_DATE,
                        S2.HACKER_ID)
                GROUP BY
                    SUBMISSION_DATE
            ) cnt_by_date
            ON cnt_by_user_date.SUBMISSION_DATE = cnt_by_date.SUBMISSION_DATE
            AND cnt_by_user_date.cnt = cnt_by_date.cnt) date_cnt_hacker
    GROUP BY
        date_cnt_hacker.SUBMISSION_DATE,
        date_cnt_hacker.cnt) date_cnt_min_hacker
    JOIN HACKERS ON date_cnt_min_hacker.HACKER_ID = HACKERS.HACKER_ID
ORDER BY
    date_cnt_min_hacker.SUBMISSION_DATE
;

SELECT
    date_cnt_min_hacker.SUBMISSION_DATE,
    date_cnt_min_hacker.cnt,
    HACKERS.HACKER_ID,
    HACKERS.NAME
FROM (
    SELECT
        date_cnt_hacker.SUBMISSION_DATE,
        date_cnt_hacker.cnt,
        MIN(date_cnt_hacker.HACKER_ID) HACKER_ID
    FROM (
        SELECT
            cnt_by_user_date.SUBMISSION_DATE,
            cnt_by_date.cnt,
            cnt_by_user_date.HACKER_ID
        FROM (
            SELECT
                S2.SUBMISSION_DATE,
                S2.HACKER_ID,
                COUNT(DISTINCT S2.SUBMISSION_ID) cnt
            FROM
                SUBMISSIONS S2
            WHERE
                S2.HACKER_ID IN (
                    SELECT
                        HACKERS.HACKER_ID
                    FROM
                        HACKERS
                        LEFT JOIN SUBMISSIONS ON HACKERS.HACKER_ID = SUBMISSIONS.HACKER_ID
                    GROUP BY
                        HACKERS.HACKER_ID
                    HAVING
                        COUNT(DISTINCT SUBMISSIONS.SUBMISSION_DATE) = (SELECT COUNT(DISTINCT SUBMISSIONS.SUBMISSION_DATE) FROM SUBMISSIONS)
                )
            GROUP BY
                S2.SUBMISSION_DATE,
                S2.HACKER_ID
            ORDER BY
                S2.SUBMISSION_DATE,
                S2.HACKER_ID) cnt_by_user_date
            JOIN (
                SELECT
                    SUBMISSION_DATE,
                    max(cnt) cnt
                FROM (
                    SELECT
                        S2.SUBMISSION_DATE,
                        S2.HACKER_ID,
                        COUNT(DISTINCT S2.SUBMISSION_ID) cnt
                    FROM
                        SUBMISSIONS S2
                    WHERE
                        S2.HACKER_ID IN (
                            SELECT
                                HACKERS.HACKER_ID
                            FROM
                                HACKERS
                                LEFT JOIN SUBMISSIONS ON HACKERS.HACKER_ID = SUBMISSIONS.HACKER_ID
                            GROUP BY
                                HACKERS.HACKER_ID
                            HAVING
                                COUNT(DISTINCT SUBMISSIONS.SUBMISSION_DATE) = (SELECT COUNT(DISTINCT SUBMISSIONS.SUBMISSION_DATE) FROM SUBMISSIONS)
                        )
                    GROUP BY
                        S2.SUBMISSION_DATE,
                        S2.HACKER_ID)
                GROUP BY
                    SUBMISSION_DATE
            ) cnt_by_date ON cnt_by_user_date.SUBMISSION_DATE = cnt_by_date.SUBMISSION_DATE
                         AND cnt_by_user_date.cnt = cnt_by_date.cnt) date_cnt_hacker
    GROUP BY
        date_cnt_hacker.SUBMISSION_DATE,
        date_cnt_hacker.cnt) date_cnt_min_hacker
    JOIN HACKERS ON date_cnt_min_hacker.HACKER_ID = HACKERS.HACKER_ID
ORDER BY
    date_cnt_min_hacker.SUBMISSION_DATE
;



SELECT
    COUNT(*)
FROM
    SUBMISSIONS; -- = 2000

SELECT
    SUBMISSION_DATE,
    SUBMISSION_ID,
    HACKER_ID,
    SCORE
FROM
    SUMISSIONS
;

-- 2016-03-01 48 650 0
-- 2016-03-01 119 3162 0
-- 2016-03-01 141 4413 0
-- 2016-03-01 203 5478 0
-- 2016-03-01 215 5509 0
