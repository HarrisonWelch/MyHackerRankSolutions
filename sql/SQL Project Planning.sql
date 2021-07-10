/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

-- Write a query to output the start and end dates of projects listed by the
-- number of days it took to complete the project in ascending order. If there
-- is more than one project that have the same number of completion days, then
-- order by the start date of the project.

SELECT
    ORIGINAL_PARENT_ID,
    END_DATE
FROM (
    SELECT
        PROJECTS.TASK_ID,
        PROJECTS.START_DATE,
        PROJECTS.END_DATE,
        connect_by_root PROJECTS.START_DATE as ORIGINAL_PARENT_ID,
        LEVEL as DEPTH
    FROM
        PROJECTS
    START WITH
        START_DATE IN (SELECT START_DATE FROM PROJECTS)
    CONNECT BY PRIOR
        END_DATE = START_DATE) T1
WHERE
    T1.ORIGINAL_PARENT_ID IN (
        SELECT
            PROJECTS.START_DATE
        FROM
            PROJECTS
        WHERE
            PROJECTS.START_DATE NOT IN (
                SELECT
                    PROJECTS.END_DATE
                FROM
                    PROJECTS))
    AND T1.END_DATE IN (
        SELECT
            PROJECTS.END_DATE
        FROM
            PROJECTS
        WHERE
            PROJECTS.END_DATE NOT IN (
                SELECT
                    PROJECTS.START_DATE
                FROM
                    PROJECTS))
ORDER BY
    DEPTH ASC,
    ORIGINAL_PARENT_ID ASC
;
