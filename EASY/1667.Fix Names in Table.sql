SELECT user_id, INITCAP(name) as name 
FROM Users
ORDER BY user_id;

SELECT user_id, UPPER(SUBSTR(name, 1, 1)) || LOWER(SUBSTR(name, 2)) as name
FROM Users
ORDER BY user_id;


LeetCode: https://leetcode.com/problems/fix-names-in-a-table/
-- First, I tried INITCAP, but it capitalizes the first letter of every word, which doesn't match the task.
-- So I used concatenation: UPPER(SUBSTR(...)) || LOWER(SUBSTR(...)) to make only the first letter uppercase and the rest lowercase.