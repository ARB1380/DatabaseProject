SET SESSION my.vars.start_time = '2023-12-12 10:30:00';
SET SESSION my.vars.end_time = '2023-12-16 10:30:00';

select national_code, sum(payable_amount) as maximum_sum
	from citizen, payment_receipt
	where time_of_issue >= current_setting('my.vars.start_time')::timestamp
		  AND time_of_issue <= current_setting('my.vars.end_time')::timestamp
		  AND
	payable_amount in (
		select p1.payable_amount from payment_receipt as p1
		ORDER BY p1.payable_amount DESC LIMIT 5
	)
group by national_code;