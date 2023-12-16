SELECT parking_id, COUNT(*) AS car_count
FROM parking_receipt
WHERE parking_id = 123456789
GROUP BY parking_id
HAVING COUNT(*) = (SELECT MAX(temp.count) 
				   FROM (SELECT COUNT(*) AS count FROM parking_receipt 
						 WHERE parking_id = 123456789 
						 GROUP BY parking_id) AS temp)
