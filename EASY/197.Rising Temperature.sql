SELECT id
FROM (
    SELECT w1.id as id, w1.recordDate, w1.temperature, w2.recordDate, w2.temperature
    FROM Weather w1
    JOIN Weather w2 ON w1.recordDate = w2.recordDate + 1
    WHERE w1.temperature > w2.temperature
) temp_comparison; -- -- Error was caused by using AS; Oracle doesn't support aliases with FROM

#LeetCode: https://leetcode.com/problems/rising-temperature/