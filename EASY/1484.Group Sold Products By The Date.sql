SELECT TO_CHAR(sell_date, 'YYYY-MM-DD') AS sell_date, 
       COUNT(product) AS num_sold,
       LISTAGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM (
    SELECT DISTINCT sell_date, product
    FROM Activities
) t
GROUP BY TO_CHAR(sell_date, 'YYYY-MM-DD')
ORDER BY sell_date;


#LeetCode: https://leetcode.com/problems/group-sold-products-by-the-date/