SELECT c1.seat_id
FROM Cinema c1
JOIN Cinema c2 ON c1.seat_id = c2.seat_id + 1
WHERE c1.free = 1 AND c2.free = 1

UNION

SELECT c1.seat_id
FROM Cinema c1
JOIN Cinema c2 ON c1.seat_id = c2.seat_id - 1
WHERE c1.free = 1 AND c2.free = 1

ORDER BY seat_id;

#LeetCode: https://leetcode.com/problems/consecutive-available-seats/
--Task:
--Find all seats that are part of a group of at least two consecutive available seats (free = 1) in the Cinema table.

--Return:
--A list of seat_ids that belong to such groups, ordered by seat_id in ascending order.