SET SESSION my.vars.parking_Id = 123456789;

SELECT parking_id, COUNT(*) AS car_count
FROM parking_receipt
WHERE parking_id = current_setting('my.vars.parking_Id')::int
GROUP BY parking_id
HAVING COUNT(*) = (SELECT MAX(temp.count) 
   FROM (SELECT COUNT(*) AS count FROM parking_receipt 
   WHERE parking_id = 123456789 
   GROUP BY parking_id) AS temp);
