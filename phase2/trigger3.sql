-- ایجاد تریگر برای رسیدهای پارکینگ
CREATE OR REPLACE FUNCTION generate_parking_receipt()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO parking_receipt(parking_id, arrival_time, departure_time)
  VALUES(NEW.city_Id, NEW.start_time, NEW.end_time);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_generate_parking_receipt
AFTER INSERT ON parking
FOR EACH ROW
EXECUTE FUNCTION generate_parking_receipt();


-- ایجاد تریگر برای رسیدهای سفر
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
