WITH imm AS(
    SELECT order_date, COUNT(delivery_id) AS count_per_date 
    FROM Delivery
    WHERE order_date = customer_pref_delivery_date
    GROUP BY order_date
),
all_ord AS(
    SELECT order_date, COUNT(delivery_id) AS count_all_per_date 
    FROM Delivery
    GROUP BY order_date
)
SELECT TO_CHAR(a.order_date, 'YYYY-MM-DD') as order_date, 
    COALESCE(
        ROUND(i.count_per_date * 100 /a.count_all_per_date, 2),
        0) as immediate_percentage
    FROM all_ord a
    LEFT JOIN imm i ON a.order_date = i.order_date
    ORDER BY a.order_date;

#LeetCode: https://leetcode.com/problems/immediate-food-delivery-iii/


--Find the percentage of immediate orders for each order date.
--An order is immediate if order_date = customer_pref_delivery_date, otherwise it's scheduled.
--Round the result to 2 decimal places and order by order_date.