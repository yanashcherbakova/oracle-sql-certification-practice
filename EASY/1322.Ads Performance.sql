WITH short AS(
    SELECT ad_id, SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) as click_count,
        SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) as view_count
        FROM Ads
        GROUP BY ad_id)
SELECT ad_id, CASE
    WHEN click_count + view_count = 0 THEN 0
    ELSE ROUND((click_count / (click_count + view_count)) * 100, 2)
    END AS ctr
FROM short
ORDER BY ctr DESC, ad_id;

#LeetCode: https://leetcode.com/problems/ads-performance/