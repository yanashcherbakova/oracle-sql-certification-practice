SELECT user_id, max(time_stamp) as last_stamp 
FROM Logins
WHERE EXTRACT(YEAR FROM time_stamp) = '2020' -- In Oracle, use EXTRACT() instead of YEAR(), MONTH(), etc., because those functions are not supported.
GROUP BY user_id;

#LeetCode: https://leetcode.com/problems/the-latest-login-in-2020/