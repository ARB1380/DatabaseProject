SET my.vars.start_time = '2023-12-12 10:30:00';
SET my.vars.end_time = '2023-12-16 10:30:00';

SELECT c.National_Code, COUNT(*) AS Visited_Stations
FROM Citizen c
INNER JOIN Citizen_Visit cv ON c.National_Code = cv.National_Code
WHERE cv.Visit_Time BETWEEN my.vars.start_time AND my.vars.end_time
GROUP BY c.National_Code
HAVING COUNT(*) > ALL (
    SELECT COUNT(*)
    FROM Citizen_Visit
    WHERE Visit_Time BETWEEN my.vars.start_time AND my.vars.end_time
    GROUP BY National_Code
    ORDER BY COUNT(*) DESC
    LIMIT 5
);


