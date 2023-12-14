SET SESSION my.vars.start_time = '2023-08-12';
SET SESSION my.vars.end_time = '2023-12-19';
SET SESSION my.vars.x = 12;
SET SESSION my.vars.y = 4;

select * 
	from station
	where station_name in (
		select s.station_name
			from station as s
				ORDER by
				sqrt (power(abs(current_setting('my.vars.x')::int - s.x_location), 2) + 
		   			  power(abs(current_setting('my.vars.y')::int - s.y_location), 2)) 	
			    ASC LIMIT 5
	);