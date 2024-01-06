
CREATE OR REPLACE FUNCTION check_credit()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT credit FROM citizen_account WHERE citizen_id = NEW.citizen_national_code) < NEW.payable_amount THEN
        INSERT INTO payment_table(receipt_code, payable_amount,time_of_issue,citizen_national_code,service_used) 
		VALUES(
			(select max(receipt_code) + 1 from payment_table),(NEW.payable_amount - (SELECT credit FROM citizen_account WHERE citizen_id = NEW.citizen_national_code)),
		New.time_od_issue,(select car.car_owner from payment_receipt join driving on payment_receipt.citizen_national_code = driving.national_code join car on driving.car_tag = car.tag where driving.national_code = new.citizen_national_code),'parking');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER chech_credit_of_citizen_using_parking
AFTER INSERT ON payment_receipt
FOR EACH ROW
WHEN(NEW.service_used = 'parking')

EXECUTE PROCEDURE check_credit();
