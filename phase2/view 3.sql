create view V3 as select car_tag, count(distinct citizen_id)
				  from travel
				  where car_tag in (select tag from car
									 where transpot_network_name = 'metro'
				 )
				 group by car_tag

