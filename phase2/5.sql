SET SESSION my.vars.x = 12;
SET SESSION my.vars.y = 4;

select * 
	from station
	where station_id in (
		select s.station_id
			from station as s
				ORDER by
				sqrt (power(abs(current_setting('my.vars.x')::int - s.x_location), 2) + 
		   			  power(abs(current_setting('my.vars.y')::int - s.y_location), 2)) 	
			    ASC LIMIT 5
	);