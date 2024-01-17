CREATE OR REPLACE FUNCTION check_travel_times() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.start_time >= NEW.end_time THEN
        RAISE EXCEPTION 'The start time must be before the end time';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER travel_receipt_time_check
BEFORE INSERT OR UPDATE OF start_time, end_time ON travel_receipt
FOR EACH ROW
EXECUTE FUNCTION check_travel_times();


CREATE OR REPLACE FUNCTION check_time_sequence() 
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.arrival_time >= NEW.departure_time THEN
    RAISE NOTICE 'The arrival time must be before the departure time';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER parking_receipt_time_check
BEFORE INSERT OR UPDATE OF arrival_time, departure_time 
ON parking_receipt
FOR EACH ROW
EXECUTE FUNCTION check_time_sequence();
