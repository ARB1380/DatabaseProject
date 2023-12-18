SET SESSION my.vars.start_date = '2023-12-12';
SET SESSION my.vars.end_date = '2023-12-16';
SET SESSION my.vars.distance = 400;


with recursive path_cte as(
	select first_station_id, second_station_id, distance
	from station_sequence
	where first_station_id in(
		select origin_id from travel
	)
	
	union all
	
	select cte.first_station_id, sr.second_station_id,cte.distance + sr.distance
	from path_cte cte
	join station_sequence sr on cte.second_station_id = sr.first_station_id

)

select * from citizen
where citizen.national_code in
(
	select citizen_id from travel join path_cte on travel.origin_id = path_cte.first_station_id
	where travel.travel_date > current_setting('my.vars.start_date'):: date
	      and travel.travel_date < current_setting('my.vars.end_date')::date
	      and travel.destination_id = path_cte.second_station_id
	group by citizen_id
	having min(distance) < current_setting('my.vars.distance')::int
	
);

