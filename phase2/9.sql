SET SESSION my.vars.parking_Id = '123456789';

SELECT   max_car_count, start_time, end_time
FROM (
    SELECT  MAX(COUNT(parking_id)) OVER() AS max_car_count, start_time, end_time
    FROM parking_receipt
    JOIN parking ON parking_receipt.city_Id = parking.city_Id
    WHERE parking_id = current_setting('my.vars.parking_Id')::int
    GROUP BY parking_id, start_time, end_time
) subquery
