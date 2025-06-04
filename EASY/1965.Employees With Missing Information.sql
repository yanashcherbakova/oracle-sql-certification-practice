SELECT employee_id
FROM (
    SELECT COALESCE(e.employee_id, s.employee_id) AS employee_id, e.name as name, s.salary as salary
        FROM Employees e
        FULL JOIN Salaries s ON e.employee_id = s.employee_id
)
WHERE name IS NULL or salary IS NULL
ORDER BY employee_id;

#LeetCode: https://leetcode.com/problems/employees-with-missing-information/

-- Use COALESCE to merge IDs into one column;
-- otherwise, FULL JOIN returns two separate ID columns with NULLs.