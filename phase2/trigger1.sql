CREATE OR REPLACE FUNCTION check_parking_payment()
RETURNS TRIGGER AS $$
BEGIN
    -- بررسی می‌کنیم که هزینه پارکینگ از اعتبار راننده بیشتر است یا خیر
    IF NEW.payable_amount > (SELECT Credit FROM Citizen_Account WHERE Citizen_Id = NEW.Citizen_National_code) THEN
        -- محاسبه باقی‌مانده هزینه پارکینگ
        NEW.payable_amount := NEW.payable_amount - (SELECT Credit FROM Citizen_Account WHERE Citizen_Id = NEW.Citizen_National_code);
        -- ایجاد رسید پرداخت ضمیمه برای مالک خودرو
        INSERT INTO payment_receipt (payable_amount, time_of_issue, Citizen_National_code) VALUES (NEW.payable_amount, current_timestamp, NEW.Citizen_National_code);
        -- منفی شدن اعتبار مالک خودرو
        UPDATE Citizen_Account SET Credit = Credit - NEW.payable_amount WHERE Citizen_Id = NEW.Citizen_National_code;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER parking_payment_trigger
BEFORE INSERT ON payment_receipt
FOR EACH ROW
EXECUTE FUNCTION check_parking_payment();
