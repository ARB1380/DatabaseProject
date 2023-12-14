SET SESSION my.vars.start_time = '2023-12-12 10:30:00';
SET SESSION my.vars.end_time = '2023-12-16 10:30:00';

select national_code, sum(covered_distance) as maximum_kilometer
	from citizen join driving
	where driving.driving_time >= current_setting('my.vars.start_time')::timestamp
		  AND driving.driving_time <= current_setting('my.vars.end_time')::timestamp

group by national_code
having (select sum(p1.covered_distance) from driving as p1
		ORDER BY p1.covered_distance DESC LIMIT 5)
;

-- ostad filmash
--taghir primary key driving , adding on update on delete