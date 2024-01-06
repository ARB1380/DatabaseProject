CREATE OR REPLACE FUNCTION delete_negative_credit()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT credit FROM citizen_account WHERE citizen_id = NEW.citizen_id) <= 0 THEN
        DELETE FROM travel WHERE citizen_id = NEW.citizen_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER not_zero_credit_2
AFTER INSERT ON travel
FOR EACH ROW
WHEN(NEW.citizen_id IS NOT NULL)

EXECUTE PROCEDURE delete_negative_credit();


