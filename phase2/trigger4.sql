CREATE OR REPLACE FUNCTION update_citizen_credit() 
RETURNS TRIGGER AS $$
BEGIN
  UPDATE Citizen_Account
  SET Credit = Credit - NEW.payable_amount
  WHERE Citizen_Id = NEW.Citizen_National_code;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_citizen_credit_trigger
BEFORE INSERT ON payment_receipt
FOR EACH ROW
EXECUTE FUNCTION update_citizen_credit();
