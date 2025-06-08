WITH reports AS(
    SELECT * from Actions
    WHERE action = 'report'
)
SELECT extra as report_reason, count(DISTINCT post_id) as report_count
    FROM reports
WHERE action_date = to_date('2019-07-05', 'YYYY-MM-DD') - 1
GROUP BY extra;

#LeetCode: https://leetcode.com/problems/reported-posts/