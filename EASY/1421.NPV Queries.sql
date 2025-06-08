SELECT q.id, q.year, COALESCE(n.npv, 0) as npv
FROM Queries q
LEFT JOIN NPV n ON q.id=n.id AND q.year=n.year;

#LeetCode: https://leetcode.com/problems/npv-queries/