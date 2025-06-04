SELECT employee_id, 
       CASE 
         WHEN MOD(employee_id, 2) = 1 AND name NOT LIKE 'M%' -- -- Avoid using employee_id % 2 = 0; use MOD() instead to prevent compatibility issues in Oracle.
         THEN salary 
         ELSE 0 
       END AS bonus
FROM Employees
ORDER BY employee_id;

#LeetCode: https://leetcode.com/problems/calculate-special-bonus/