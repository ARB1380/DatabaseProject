SET SESSION my.vars.start_time = '2023-12-12 10:30:00';
SET SESSION my.vars.end_time = '2023-12-16 10:30:00';
SET SESSION my.vars.parking_Id = '123456789';


SELECT COUNT(DISTINCT c.Tag) AS car_count
FROM car c
JOIN parking_receipt pr ON c.Tag = pr.national_code
WHERE pr.parking_receipt_id = current_setting('my.vars.parking_Id')::char(10)
  AND pr.arrival_time >= CAST(current_setting('my.vars.start_time') AS TIMESTAMP)
  AND pr.departure_time <= CAST(current_setting('my.vars.end_time') AS TIMESTAMP)
GROUP BY c.Brand, c.Color;


