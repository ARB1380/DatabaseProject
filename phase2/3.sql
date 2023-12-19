SET SESSION my.vars.start_time = '2023-12-12 10:30:00';
SET SESSION my.vars.end_time = '2023-12-16 10:30:00';

select national_id, sum(covered_distance) as maximum_distance
	from driving
	where driving_time >= current_setting('my.vars.start_time')::timestamp
		  AND driving_time <= current_setting('my.vars.end_time')::timestamp

group by national_id
having sum(covered_distance) in(select sum(p1.covered_distance) 
								from driving as p1
								group by p1.national_id
								ORDER BY sum(p1.covered_distance) DESC LIMIT 5);
