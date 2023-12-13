set session my.vars.id = '12345678';
set session my.vars.cost = 1400000;

WITH RECURSIVE path_cte AS (
  SELECT first_station_id, second_station_id, distance
  FROM station_sequence
  WHERE first_station_id = current_setting('my.vars.id')

  UNION ALL

  SELECT cte.first_station_id, sr.second_station_id, cte.distance + sr.distance
  FROM path_cte cte
  JOIN station_sequence sr ON cte.second_station_id = sr.first_station_id
	
)
select second_station_id,x_location, y_location
from path_cte join station on station.station_id= path_cte.second_station_id
where second_station_id in (select station_id 
						    from  station_r_path join path on station_r_path.path_id = path.path_id
						    where transpot_network_name = 'taxi'
						   )
	  and current_setting('my.vars.cost')::int >= distance * (select cost_per_kilometer / 1000 
															  from transport_network
				                                              where transpot_network_name = 'taxi')
			

