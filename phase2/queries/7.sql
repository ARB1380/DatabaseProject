SET SESSION my.vars.start_time = '2023-12-12 10:30:00';
SET SESSION my.vars.end_time = '2023-12-16 10:30:00';

WITH MetroTravelTimes AS (
    SELECT
        tr.Citizen_Id,
        COALESCE(SUM(EXTRACT(EPOCH FROM (trr.end_time - trr.start_time))), 0) AS total_metro_time
    FROM
        travel_receipt trr
        INNER JOIN travel tr ON tr.Citizen_Id = trr.Citizen_Id AND tr.Car_Tag = trr.Car_Tag AND tr.Travel_Date = trr.Travel_Date
    WHERE
        trr.start_time >= CAST(current_setting('my.vars.start_time') AS timestamp) AND trr.end_time <= CAST(current_setting('my.vars.end_time') AS timestamp)
    GROUP BY
        tr.Citizen_Id
),
BusTravelTimes AS (
    SELECT
        tr.Citizen_Id,
        COALESCE(SUM(EXTRACT(EPOCH FROM (trr.end_time - trr.start_time))), 0) AS total_bus_time
    FROM
        travel_receipt trr
        INNER JOIN travel tr ON tr.Citizen_Id = trr.Citizen_Id AND tr.Car_Tag = trr.Car_Tag AND tr.Travel_Date = trr.Travel_Date
    WHERE
        trr.start_time >= CAST(current_setting('my.vars.start_time') AS timestamp) AND trr.end_time <= CAST(current_setting('my.vars.end_time') AS timestamp)
    GROUP BY
        tr.Citizen_Id
)
SELECT
    c.national_code,c.first_name,c.last_name
FROM
    Citizen c
    INNER JOIN MetroTravelTimes mtt ON c.National_Code = mtt.Citizen_Id
    INNER JOIN BusTravelTimes btt ON c.National_Code = btt.Citizen_Id
WHERE
    mtt.total_metro_time > btt.total_bus_time;
