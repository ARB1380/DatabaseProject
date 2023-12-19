set session my.vars.distance = 400;


create view V1 as
select citizen.national_code from citizen join driving on citizen.national_code = driving.national_id 
where driving.drive_date >= date_trunc('month', CURRENT_DATE) - interval '1 month'
and driving.car_tag in (select car_tag from car where transpot_network_name = 'bus')
group by citizen.national_code
having sum(driving.covered_distance) < current_setting('my.vars.distance')::int



