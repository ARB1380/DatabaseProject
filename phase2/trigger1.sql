CREATE OR REPLACE FUNCTION check_parking_payment()
RETURNS TRIGGER AS $$
BEGIN
    -- Checking if the parking fee exceeds the driver's credit
    IF NEW.payable_amount > (SELECT Credit FROM Citizen_Account WHERE Citizen_Id = NEW.Citizen_National_code) THEN
        -- Calculating the remaining parking fee
        NEW.payable_amount := NEW.payable_amount - (SELECT Credit FROM Citizen_Account WHERE Citizen_Id = NEW.Citizen_National_code);
        -- Creating a supplementary payment receipt for the vehicle owner
        INSERT INTO payment_receipt (payable_amount, time_of_issue, Citizen_National_code) VALUES (NEW.payable_amount, current_timestamp, NEW.Citizen_National_code);
        -- Deducting the vehicle owner's credit
        UPDATE Citizen_Account SET Credit = Credit - NEW.payable_amount WHERE Citizen_Id = NEW.Citizen_National_code;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER parking_payment_trigger
BEFORE INSERT ON payment_receipt
FOR EACH ROW
EXECUTE FUNCTION check_parking_payment();
