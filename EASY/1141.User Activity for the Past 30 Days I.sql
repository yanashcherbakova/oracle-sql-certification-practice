WITH dis AS(
    SELECT DISTINCT user_id, activity_date
    FROM Activity
)
SELECT to_char(activity_date, 'YYYY-MM-DD') as day, COUNT(user_id) as active_users
FROM dis
WHERE activity_date BETWEEN (to_date('2019-07-27', 'YYYY-MM-DD') - 29) AND to_date('2019-07-27', 'YYYY-MM-DD')
GROUP BY activity_date
ORDER BY activity_date;

#LeetCode: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/