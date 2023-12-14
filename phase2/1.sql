SET SESSION my.vars.start_time = '2023-08-12';
SET SESSION my.vars.end_time = '2023-12-19';
SET SESSION my.vars.id = '1234567891';

select all count(All citizen_id) as number_of_travels 
	from travel
	where travel_date <= current_setting('my.vars.end_time')::Date
	AND travel_date >= current_setting('my.vars.start_time')::Date
	--AND rannade = current_setting('my.vars.id')::Char(10) in  --- shahrvand rannade toosh bashe

	group by car_tag, origin, destination, travel_date
	having (count(citizen_id in (select c1.national_code
							   from citizen as c1
								where c1.gender = 'F'	   
							 )) / count(citizen_id in (select c1.national_code
							   from citizen as c1
								where c1.gender = 'M'	
									   )) >= 0.6);
									   
									   
									   
	--join agar kar nakard join mikonim baray gender kardan

	