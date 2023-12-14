SET SESSION my.vars.start_time = '2023-12-12 10:30:00';
SET SESSION my.vars.end_time = '2023-12-16 10:30:00';

SELECT *
FROM citizen
WHERE national_code IN (
    SELECT p1.national_code
    FROM parking_receipt AS p1, parking_receipt AS p2
    WHERE p1.parking_receipt_id <> p2.parking_receipt_id
        AND p1.national_code = p2.national_code
        AND DATE_ADD(DATE(p1.arrival_time), INTERVAL '1' DAY) = DATE(p2.arrival_time)
        AND p1.arrival_time > current_setting('my.vars.start_time')::timestamp
        AND p1.departure_time < current_setting('my.vars.end_time')::timestamp
        AND p2.arrival_time > current_setting('my.vars.start_time')::timestamp
        AND p2.departure_time < current_setting('my.vars.end_time')::timestamp
);

-- select remove