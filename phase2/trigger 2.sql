CREATE OR REPLACE FUNCTION delete_negative_credit()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT credit FROM citizen_account WHERE citizen_id = NEW.national_code) <= 0 THEN
        DELETE FROM parking_usage WHERE national_code = NEW.national_code;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER not_zero_credit
AFTER INSERT ON parking_usage
FOR EACH ROW
WHEN (NEW.national_code IS NOT NULL)

EXECUTE PROCEDURE delete_negative_credit();


