SELECT p.product_name, SUM(o.unit) as unit
    FROM ORDERS o
JOIN Products p ON o.product_id = p.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;

#LeetCode: https://leetcode.com/problems/list-the-products-ordered-in-a-period/
