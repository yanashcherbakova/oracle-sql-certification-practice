SELECT s.user_id, 
    (
        CASE WHEN COUNT(c.action) = 0 THEN 0
        ELSE ROUND(
            COUNT(CASE WHEN c.action = 'confirmed' THEN 1 END) *1.0 / COUNT(c.action),
            2)
        END
    ) as confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;

#LeetCode: https://leetcode.com/problems/confirmation-rate/description/