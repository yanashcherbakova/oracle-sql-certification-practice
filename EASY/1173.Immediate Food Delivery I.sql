SELECT
    ROUND(
    (Select COUNT(*) FROM Delivery WHERE order_date = customer_pref_delivery_date) * 100 /
    (SELECT COUNT(*) FROM Delivery),
    2) AS immediate_percentage
FROM DUAL;

#LeetCode: https://leetcode.com/problems/immediate-food-delivery-i/