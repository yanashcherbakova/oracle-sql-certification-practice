SELECT u.name, COALESCE(SUM(r.distance), 0) as travelled_distance
FROM Users u
LEFT JOIN RIdes r ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY COALESCE(SUM(r.distance), 0) DESC, u.name;

LeetCode: https://leetcode.com/problems/top-travellers/