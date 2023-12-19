-- Create a trigger to generate parking receipts
CREATE TRIGGER trg_generate_parking_receipt
AFTER INSERT ON parking
FOR EACH ROW
EXECUTE FUNCTION generate_parking_receipt();


-- Create a trigger for travel receipts
CREATE OR REPLACE FUNCTION generate_travel_receipt()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO travel_receipt(travel_code, start_time, end_time)
  VALUES(NEW.Citizen_Id, NEW.start_time, NEW.end_time);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_generate_travel_receipt
AFTER INSERT ON travel
FOR EACH ROW
EXECUTE FUNCTION generate_travel_receipt();
