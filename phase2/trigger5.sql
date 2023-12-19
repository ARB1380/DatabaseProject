CREATE OR REPLACE FUNCTION validate_travel_time() 
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.start_time >= NEW.end_time THEN
    RAISE EXCEPTION 'Start time must be less than end time';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER travel_receipt_time_check
BEFORE INSERT OR UPDATE ON travel_receipt
FOR EACH ROW
EXECUTE FUNCTION validate_travel_time();

CREATE OR REPLACE FUNCTION validate_parking_time() 
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.arrival_time >= NEW.departure_time THEN
    RAISE EXCEPTION 'Arrival time must be less than departure time';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER parking_receipt_time_check
BEFORE INSERT OR UPDATE ON parking_receipt
FOR EACH ROW
EXECUTE FUNCTION validate_parking_time();
