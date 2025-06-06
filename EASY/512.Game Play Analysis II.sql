SELECT player_id, device_id
FROM Activity
WHERE (player_id, event_date) IN (
    SELECT player_id, min(event_date) as event_date
    FROM Activity
    GROUP BY player_id
);

#LeetCode: https://leetcode.com/problems/game-play-analysis-ii/