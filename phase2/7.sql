SET SESSION my.vars.start_time = '2023-12-12 10:30:00';
SET SESSION my.vars.end_time = '2023-12-16 10:30:00';

SELECT c.First_Name, c.Last_Name
FROM Citizen c
JOIN (
    SELECT t.National_Code,
           SUM(CASE WHEN tn.Transpot_Network_Name = 'Metro' THEN spt.Period_Of_Time ELSE 0 END) AS metro_time,
           SUM(CASE WHEN tn.Transpot_Network_Name = 'Bus' THEN spt.Period_Of_Time ELSE 0 END) AS bus_time
    FROM Citizen t
    JOIN path p ON t.Path_Id = p.Path_Id
    JOIN sequence_station spt ON spt.Path_Id = p.Path_Id
    JOIN station_R_path srp ON srp.Path_Id = p.Path_Id
    JOIN transport_network tn ON spt.Transpot_Network_Name = tn.Transpot_Network_Name
    WHERE t.Birth_Date >= 'start_date' AND t.Birth_Date <= 'end_date'
    GROUP BY t.National_Code
) sub ON c.National_Code = sub.National_Code
WHERE sub.metro_time > sub.bus_time;
