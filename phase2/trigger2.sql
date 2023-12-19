CREATE OR REPLACE FUNCTION check_citizen_credit()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM Citizen_Account WHERE Citizen_Id = NEW.Citizen_Id AND Credit <= 0) THEN
        RAISE EXCEPTION 'Citizen does not have enough credit to use public transportation and parking';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_citizen_credit
BEFORE INSERT ON payment_receipt
FOR EACH ROW
EXECUTE FUNCTION check_citizen_credit();

CREATE TRIGGER enforce_citizen_credit_update
BEFORE UPDATE ON payment_receipt
FOR EACH ROW
EXECUTE FUNCTION check_citizen_credit();
