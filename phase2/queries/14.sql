set session my.vars.origin_station_id = '1234';
set session my.vars.destination_station_id = '12345';

WITH RECURSIVE path_cte AS (
  SELECT first_station_id, second_station_id, distance
  FROM station_sequence
  WHERE first_station_id = current_setting('my.vars.origin_station_id')
	    and second_station_id in (
			                   select station_id 
						       from  station_r_path join path on station_r_path.path_id = path.path_id
	         			       where transpot_network_name = 'metro'
		)

  UNION ALL

  SELECT cte.first_station_id, sr.second_station_id, cte.distance + sr.distance
  FROM path_cte cte
  JOIN station_sequence sr ON cte.second_station_id = sr.first_station_id
	
)

select min(distance)
from path_cte
where second_station_id = current_setting('my.vars.destination_station_id')