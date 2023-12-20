SET SESSION my.vars.start_time = '2000-12-12 10:30:00';
SET SESSION my.vars.end_time = '2023-12-16 10:30:00';
SET SESSION my.vars.stationId = '2000934598';

select count(distinct car_tag) as numberOfCars, DATE_TRUNC('month', travel_date) as month
	from travel
	where travel_date >= current_setting('my.vars.start_time')::timestamp
		  AND travel_date <= current_setting('my.vars.end_time')::timestamp
		  AND (origin_id = current_setting('my.vars.stationId') or destination_id = current_setting('my.vars.stationId'))
		  
	group by DATE_TRUNC('month', travel_date);