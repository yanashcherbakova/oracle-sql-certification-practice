SELECT DISTINCT p.product_id, p.product_name
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
WHERE s.sale_date BETWEEN '2019-01-01' and '2019-03-31' 
AND NOT EXISTS (
    SELECT 1
    FROM Sales s2
    WHERE p.product_id = s2.product_id AND (s2.sale_date < '2019-01-01' OR s2.sale_date > '2019-03-31')
);

LeetCode: https://leetcode.com/problems/sales-analysis-iii/