SET SESSION my.vars.start_time = '2023-08-12';
SET SESSION my.vars.end_time = '2023-12-19';
SET SESSION my.vars.id = '1234567891';

select all count(All citizen_id) as number_of_travels 
	from travel
	where travel_date <= current_setting('my.vars.end_time')::Date
	AND travel_date >= current_setting('my.vars.start_time')::Date
	AND current_setting('my.vars.id')::Char(10) in (
	select national_code from citizen
		group by national_code
		having (count(citizen.gender = 'F') / count(citizen.gender = 'M')) >= 0.6	
	);