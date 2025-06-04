WITH WorkTable AS(
    SELECT machine_id, process_id,
    MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
    MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
)
SELECT machine_id, ROUND(AVG(end_time - start_time), 3) as processing_time
FROM WorkTable
Group by machine_id;


#LeetCode: https://leetcode.com/problems/average-time-by-machine/

--Created a temporary table (WITH CTE) to extract the start and end timestamps for each machine_id + process_id pair.
--Used MAX(CASE WHEN ...) to get start_time and end_time without a subquery. This avoids the need for separate SELECT statements.