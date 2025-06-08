SELECT DISTINCT c.title
FROM TVProgram tv
JOIN Content c ON c.content_id = tv.content_id
WHERE c.Kids_content = 'Y' 
    AND TRUNC(tv.program_date) BETWEEN DATE '2020-06-01' AND DATE '2020-06-30'
    AND c.content_type = 'Movies';


#LeetCode: https://leetcode.com/problems/friendly-movies-streamed-last-month/