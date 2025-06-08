WITH session_minutes AS (
    SELECT employee_id,
           CEIL((out_time - in_time) * 24 * 60) AS session_minutes
    FROM Logs
),
total_minutes AS (
    SELECT employee_id,
           SUM(session_minutes) AS at_work
    FROM session_minutes
    GROUP BY employee_id
)
SELECT e.employee_id
FROM Employees e
LEFT JOIN total_minutes t ON e.employee_id = t.employee_id
WHERE t.at_work IS NULL 
   OR t.at_work < e.needed_hours * 60;

#LeetCode: https://leetcode.com/problems/employees-with-deductions/

-- We use two CTEs because rounding must be done per session, not after aggregation.
-- The first CTE calculates the duration of each work session in minutes and rounds it up.
-- The second CTE aggregates the total rounded minutes per employee.