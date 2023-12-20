SET SESSION my.vars.start_time = '2023-08-12';
SET SESSION my.vars.end_time = '2023-12-19';
SET SESSION my.vars.id = '1234567891';

select all count(*) as number_of_travels 
	from travel as tr join driving as d ON tr.car_tag = d.car_tag
	where tr.travel_date <= current_setting('my.vars.end_time')::Date
	AND tr.travel_date >= current_setting('my.vars.start_time')::Date
	AND d.national_id = current_setting('my.vars.id')::Char(10)

	group by tr.car_tag, tr.origin_id, tr.destination_id, tr.travel_date
	having (count(citizen_id in (select c1.national_code
							   from citizen as c1
								where c1.gender = 'F'	   
							 )) / count(citizen_id in (select c1.national_code
							   from citizen as c1
								where c1.gender = 'M'	
									   )) >= 0.6);
									   
									   
									   
	--agar kar nakard join mikonim baray gender kardan

	