SELECT employee_id
FROM Employees e
WHERE salary < 30000
  AND NOT EXISTS (
    SELECT 1 FROM Employees m WHERE m.employee_id = e.manager_id
  )
ORDER BY employee_id;

#LeetCode: https://leetcode.com/problems/employees-whose-manager-left-the-company/