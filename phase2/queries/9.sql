SET SESSION my.vars.parking_Id = '123456789';
with e as (
      select arrival_time as dte, 1 as inc
      from parking_receipt JOIN driving_citizen ON parking_receipt.national_code = driving_citizen.national_code
	  WHERE driving_citizen.city_id = current_setting('my.vars.parking_Id')::char(10)
      union all
      select departure_time as dte, -1 as inc
      from parking_receipt JOIN driving_citizen ON parking_receipt.national_code = driving_citizen.national_code
	  WHERE driving_citizen.city_id = current_setting('my.vars.parking_Id')::char(10)
     )
select dte, next_dte, concurrent
from (select dte, sum(sum(inc)) over (order by dte) as concurrent,
             lead(dte) over (partition by dte) as next_dte
      from e
      group by dte
     ) e
order by concurrent desc
fetch first 1 row only;
	 

-- select dte, next_dte, concurrent
-- from (select dte, sum(sum(inc)) over (order by dte) as concurrent,
--              lead(dte) over (partition by dte) as next_dte
--       from e
--       group by dte
--      ) e
-- order by concurrent desc
-- fetch first 1 row only;

-- select * from driving_citizen;
-- alter table driving_citizen
-- add column city_id char(10);
-- alter table driving_citizen
-- add constraint cs foreign key(city_id) references parking(city_id);

