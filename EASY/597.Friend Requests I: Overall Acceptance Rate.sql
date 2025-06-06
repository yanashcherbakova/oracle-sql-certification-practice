SELECT
    CASE
        WHEN accept_count = 0 THEN 0
        ELSE ROUND(req_count / accept_count, 2)
    END AS accept_rate
FROM (
    SELECT
        (SELECT COUNT(*) FROM (     -- -- Oracle doesn't support COUNT(DISTINCT col1, col2)
            SELECT DISTINCT requester_id, accepter_id
            FROM RequestAccepted
        )) AS req_count,
        
        (SELECT COUNT(*) FROM (
            SELECT DISTINCT sender_id, send_to_id
            FROM FriendRequest
        )) AS accept_count
    FROM dual
) sub;

#LeetCode: https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/
-- Calculate acceptance rate: unique accepted pairs / unique sent pairs
-- Count duplicates only once; accepted pairs may not exist in FriendRequest
-- Return 0.00 if no requests; round to 2 decimal places