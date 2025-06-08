SELECT s.id, s.name
    FROM STUDENTS s
LEFT JOIN Departments d ON s.department_id = d.id
WHERE d.id is NULL;

#LeetCode: https://leetcode.com/problems/students-with-invalid-departments/