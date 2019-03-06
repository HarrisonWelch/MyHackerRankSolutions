-- Contest Leaderboard

-- You did such a great job helping Julia with her last coding
-- contest challenge that she wants you to work on this one, too!

-- The total score of a hacker is the sum of their maximum scores
-- for all of the challenges. Write a query to print the hacker_id, 
-- name, and total score of the hackers ordered by the descending score. 
-- If more than one hacker achieved the same total score, then sort the 
-- result by ascending hacker_id. Exclude all hackers with a total 
-- score of 0 from your result.

SELECT
  HACKERS.hacker_id, HACKERS.name, sum(score) as total
FROM HACKERS
  INNER JOIN (select hacker_id,  max(score) as score from SUBMISSIONS group by challenge_id, hacker_id) max_score ON HACKERS.hacker_id = max_score.hacker_id
GROUP BY
  HACKERS.hacker_id, HACKERS.name
HAVING
  total > 0
ORDER BY
  total DESC, HACKERS.hacker_id ASC;
