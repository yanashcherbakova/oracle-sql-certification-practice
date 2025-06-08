WITH bins AS(
    SELECT '[0-5>' AS bin FROM dual UNION ALL
    SELECT '[5-10>' FROM dual UNION ALL
    SELECT '[10-15>' FROM dual UNION ALL
    SELECT '15 or more' FROM dual
),
minutes_table AS(
    SELECT session_id,
    CASE
        WHEN duration < 300 THEN '[0-5>'
        WHEN duration < 600 THEN '[5-10>'
        WHEN duration < 900 THEN '[10-15>'
        ELSE '15 or more'
    END AS bin
    FROM Sessions
),
counts AS (
    SELECT bin, COUNT(*) AS total
    FROM minutes_table
    GROUP BY bin
    )
SELECT b.bin, COALESCE(c.total, 0) AS total
FROM bins b
LEFT JOIN counts c ON b.bin = c.bin;


#LeetCode: https://leetcode.com/problems/create-a-session-bar-chart/