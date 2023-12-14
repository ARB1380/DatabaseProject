SET SESSION my.vars.start_time = '2023-12-12 10:30:00';
SET SESSION my.vars.end_time = '2023-12-16 10:30:00';

select overseer_citizen_id, sum(payable_amount) as maximum_sum
	from citizen join payment_receipt on citizen.national_code = payment_receipt.citizen_national_code
	where payment_receipt.time_of_issue >= current_setting('my.vars.start_time')::timestamp
		  AND payment_receipt.time_of_issue <= current_setting('my.vars.end_time')::timestamp

group by overseer_citizen_id
having 	payment_receipt.payable_amount in (
		select p1.payable_amount from payment_receipt as p1
		ORDER BY p1.payable_amount DESC LIMIT 5
	)
	
	
-- sotoon overseer ra not null konim
-- too filmaye ostad hast maktabkhooneh
