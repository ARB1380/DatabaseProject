select citizen_national_code, avg(payable_amount) as average_payment 
from payment_receipt
where service_used = 'travel'
	 and citizen_national_code in (select car_owner from car
							  	   where car_owner IS NOT NULL)
group by citizen_national_code