SET SESSION my.vars.start_time = '2000-12-12 10:30:00';
SET SESSION my.vars.end_time = '2023-12-16 10:30:00';

select overseer_citizen_id, sum(payable_amount) as maximum_sum
	from citizen join payment_receipt on citizen.national_code = payment_receipt.citizen_national_code
	where payment_receipt.time_of_issue >= current_setting('my.vars.start_time')::timestamp
		  AND payment_receipt.time_of_issue <= current_setting('my.vars.end_time')::timestamp

group by overseer_citizen_id
having 	sum(payment_receipt.payable_amount) in (
		select sum(p1.payable_amount) 
			from payment_receipt as p1 join citizen as ci ON ci.national_code = p1.citizen_national_code
			group by ci.overseer_citizen_id
			ORDER BY sum(p1.payable_amount) DESC LIMIT 5
	)
	
