set session my.vars.usage_amount = 100;


create view V4 as 
select home.city_id, home.address, home.x_location,
                   home.y_location, home.national_id				  
				   from home join services_usage on home.national_id = services_usage.national_id
				   where services_usage.usage_date >= date_trunc('month', CURRENT_DATE) - interval '1 month'
                   and services_usage.type_service = 'electricity'
				   and services_usage.amount_of_usage > current_setting('my.vars.usage_amount'):: int

