-- create table Citizen(
-- 	First_Name Varchar(20),
-- 	Last_Name Varchar(20),
-- 	Birth_Date Date,
-- 	Gender Char(1),
-- 	National_Code Char(10) Primary Key,
-- 	Check (Gender in ('F','M'))
-- );


-- Alter Table Citizen
-- Add Column Overseer_Citizen_Id Char(10);

-- ALTER TABLE Citizen
-- ADD FOREIGN KEY (Overseer_Citizen_Id) REFERENCES Citizen(National_Code);

-- Select * from Citizen;

-- Insert Into Citizen Values('ali','hezaveh','2022-12-12','M','1234567890', '4421045209');
-- Insert Into Citizen Values('alireza','farshi','2022-12-12','M','4421045209',NULL);

-- create table Citizen_Account(
-- 	Citizen_Id Char(10) Primary Key,
-- 	Credit Int,
-- 	Payment Int,
-- 	Deposit Int,
-- 	Foreign Key (Citizen_Id) References Citizen(National_Code)
-- );

-- create table payment_receipt(
-- 	receipt_code Integer Primary Key,
-- 	payable_amount Integer,
-- 	time_of_issue timestamp,
-- 	check (payable_amount >= 0)
-- );

-- create table travel_receipt(
-- 	travel_code integer Primary Key,
-- 	start_time timestamp,
-- 	end_time   timestamp,
-- 	check (start_time < end_time)
-- );

-- create table parking_receipt(
-- 	parking_id Integer Primary Key,
-- 	arrival_time time,
-- 	departure_time time
-- 	check (arrival_time < departure_time)
-- );

-- create table city_service_receipt(
-- 	city_service_receipt_id Integer Primary Key,
-- 	type_of_service varchar(20),
-- 	check (type_of_service in ('electricity','gas', 'water'))
-- );


-- Alter table payment_receipt
-- Add Column Citizen_National_code Char(10);


-- Alter table payment_receipt
-- ADD FOREIGN KEY (Citizen_National_code) REFERENCES Citizen(National_Code);

------------------------------------------------------------------------------------

-- create table transport_network (
-- 	Transpot_Network_Name Varchar(10) Primary key,
-- 	Cost_per_Kilometer Int
-- );

-- create table car (
-- 	Tag Char(8) Primary key,
-- 	Car_Owner Char(10),
-- 	Color Varchar(15),
-- 	Chassis_Number Char(17),
-- 	Brand Varchar(20),
-- 	Transpot_Network_Name Varchar(10),
-- 	Foreign Key (Transpot_Network_Name) References transport_network(Transpot_Network_Name),
-- 	Foreign Key (Car_Owner) References Citizen(National_Code)
-- );

-- create table road (
-- 	Road_Name varchar(20),
-- 	Transpot_Network_Name Varchar(10),
-- 	Road_Id varchar(20) Primary key,
--  Foreign Key (Transpot_Network_Name) References transport_network(Transpot_Network_Name)
-- );

-- create table station (
-- 	Station_Name varchar(20),
-- 	Station_GPS varchar(20) Primary key
-- );

-- create table sequence_station (
-- 	First_Station varchar(20),
-- 	Second_Station varchar(20),
-- 	Distance Int,
-- 	Period_Of_Time Int,
-- 	Foreign key (First_Station) References station (Station_GPS),
-- 	Foreign key (Second_Station) References station (Station_GPS)
-- );

-- create table station_R_road (
-- 	Road_Id varchar(20),
-- 	Station_GPS varchar(20),
-- 	Foreign key (Road_Id) References road (Road_Id),
-- 	Foreign key (Station_GPS) References station (Station_GPS)
-- );


-- create table travel (
-- 	Citizen_Id Char(10),
-- 	Car_Tag Char(8),
-- 	Origin varchar(20),
-- 	Destination varchar(20),
-- 	Travel_Date Date,
-- 	Foreign key (Citizen_Id) References citizen (National_Code),
-- 	Foreign key (Car_Tag) References car (Tag)	
-- );
