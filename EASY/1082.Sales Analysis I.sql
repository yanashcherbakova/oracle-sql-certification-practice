WITH tot AS(
    SELECT seller_id, SUM(price) as total_sales
    FROM Sales
    GROUP BY seller_id
)
SELECT seller_id
FROM tot
WHERE total_sales = (
    SELECT max(total_sales) FROM tot
);

#LeetCode: https://leetcode.com/problems/sales-analysis-i/