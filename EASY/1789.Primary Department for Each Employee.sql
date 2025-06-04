SELECT employee_id, department_id FROM Employee
WHERE employee_id in (
    SELECT employee_id FROM Employee   -- Used a subquery before the UNION because GROUP BY requires aggregation on all selected columns.
    GROUP BY employee_id               -- We first find employee_ids with only one record, then join back to get department_id.
    HAVING count(*) = 1
    );

UNION

SELECT employee_id, department_id FROM Employee
WHERE primary_flag = 'Y';

#LeetCode: https://leetcode.com/problems/primary-department-for-each-employee/