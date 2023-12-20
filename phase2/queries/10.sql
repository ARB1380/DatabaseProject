set session my.vars.citizen_Id = '4421045209';

SELECT EXTRACT(MONTH from p.time_of_issue) AS issue_month,
       SUM(p.payable_amount) AS total_payment
  FROM payment_receipt p
  JOIN citizen c ON p.citizen_national_code = c.national_code
 WHERE c.national_code = current_setting('my.vars.citizen_Id')
 GROUP BY issue_month
 ORDER BY issue_month;
