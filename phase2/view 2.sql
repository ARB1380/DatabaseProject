create View V2 as

select citizen_visit.station_id as station, count(citizen_visit.national_code) from citizen_visit
where station_id in (
	select station_id from station_r_path join path on station_r_path.path_id = path.path_id
	where path.transpot_network_name = 'bus'
)
and citizen_visit.visit_date >= current_timestamp - interval '24 hours'
group by citizen_visit.station_id;


