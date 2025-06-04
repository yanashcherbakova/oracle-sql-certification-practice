SELECT product_id, store, price
FROM Products
UNPIVOT (
    price FOR store IN (store1 AS 'store1', store2 AS 'store2', store3 AS 'store3') -- -- Use aliases to prevent Oracle from uppercasing values like STORE1.
)
WHERE price IS NOT NULL
ORDER BY product_id, store;

#LeetCode: https://leetcode.com/problems/rearrange-products-table/