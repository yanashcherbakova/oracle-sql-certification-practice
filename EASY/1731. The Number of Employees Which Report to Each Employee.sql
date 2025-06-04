WITH work_table AS(
    Select e1.employee_id, e1.reports_to as reports_to, e2.employee_id as manager_id, e2.name as manager_name, e1.age as reporter_age
    FROM Employees e1
    JOIN Employees e2 ON e1.reports_to = e2.employee_id
    WHERE e1.reports_to IS NOT NULL
)
SELECT manager_id as employee_id, manager_name as name, count(*) as reports_count, ROUND(avg(reporter_age)) as average_age
FROM work_table
GROUP BY manager_id, manager_name
ORDER BY employee_id;

#LeetCode: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/