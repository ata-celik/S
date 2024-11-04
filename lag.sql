-- Compute the gaps
WITH request_gaps AS (
    SELECT date_created,
           -- retrieve the date_created value of the previous row 
           lag(date_created) OVER (ORDER BY date_created) AS previous,
           -- calculates the time gap between the current row and the previous row by subtracting the 
		   -- date_created value of the previous row from the current row's date_created value --
           date_created - lag(date_created) OVER (ORDER BY date_created) AS gap
    FROM evanston311)
-- Select the row with the maximum gap
SELECT *
FROM request_gaps
-- Subquery to select maximum gap from request_gaps
WHERE gap = (SELECT MAX(gap)
             FROM request_gaps);
