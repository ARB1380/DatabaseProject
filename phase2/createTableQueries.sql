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
-- 	Cost_per_Kilometer Int,
--  check (Cost_per_Kilometer > 0)
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

-- create table path (
-- 	Path_Name varchar(20),
-- 	Transpot_Network_Name Varchar(10),
-- 	Path_Id varchar(20) Primary key,
--  Foreign Key (Transpot_Network_Name) References transport_network(Transpot_Network_Name)
-- );

-- create table station (
-- 	Station_Name varchar(20) Primary key,
-- 	x_location  Int,
--     y_location Int,
-- 	constraint uniq unique(x_location, y_location)
-- );
	
-- create table sequence_station (
-- 	First_Station varchar(20),
-- 	Second_Station varchar(20),
-- 	Distance Int,
-- 	Period_Of_Time Int,
--     check (Distance > 0),
--     check (Period_Of_Time > 0),
--     primary key(First_Station, Second_Station),
-- 	Foreign key (First_Station) References station (Station_Name),
-- 	Foreign key (Second_Station) References station (Station_Name)
-- );

-- create table station_R_path (
-- 	Path_Id varchar(20),
-- 	Station_Name varchar(20),
--  primary key (Path_Id, station_Name),
-- 	Foreign key (Path_Id) References path (Path_Id),
-- 	Foreign key (Station_Name) References station (Station_Name)
-- );


-- create table travel (
-- 	Citizen_Id Char(10),
-- 	Car_Tag Char(8),
-- 	Origin varchar(20),
-- 	Destination varchar(20),
-- 	Travel_Date Date,
--  primary key (Citizen_Id , Car_Tag, Travel_Date),
-- 	Foreign key (Citizen_Id) References citizen (National_Code),
-- 	Foreign key (Car_Tag) References car (Tag)	
-- );



-- alter table travel_receipt 
-- 	add column Citizen_Id Char(10),
-- 	add column Car_Tag char(8),
-- 	add column Travel_Date Date;

-- alter table travel_receipt
-- 	Add foreign key (Citizen_Id) References citizen(National_Code)
-- 	on update cascade
-- 	on delete cascade,
-- 	add foreign key (Car_Tag) References car (Tag)
-- 	on update cascade
-- 	on delete cascade;

-- alter table travel_receipt
-- 	add constraint foreign_keys 
-- 	Foreign key (Citizen_Id, Car_Tag, Travel_Date) references travel (Citizen_Id, Car_Tag, Travel_Date)
-- 	on update cascade
-- 	on delete cascade;
------------------------------------------------------------------
-- create table home_owner (
-- 	national_Id char(10) primary key,
-- 	foreign key (national_Id) references citizen(National_Code)
-- 	on delete cascade
-- 	on update cascade
-- );

-- create table home(
-- 	city_Id char(10),
-- 	address varchar(200),
-- 	x_location int,
-- 	y_location int,
-- 	national_Id char(10),
-- 	primary key (city_Id),
-- 	foreign key (national_Id) references home_owner(national_Id)
-- 	on delete cascade
-- 	on update cascade,
-- 	constraint location_h unique (x_location,y_location)
-- );

-- create table parking (
-- 	city_Id char(10),
-- 	parking_name varchar(100),
-- 	start_time time,
-- 	end_time time,
-- 	x_location int,
-- 	y_location int,
-- 	hourly_cost int,
-- 	check (start_time<end_time),
-- 	check (hourly_cost>0),
-- 	primary key (city_Id),
-- 	constraint location_p unique (x_location,y_location)
-- );

-- create table driver_citizen (
-- 	national_Id char(10) primary key,
-- 	city_Id char(10),
-- 	foreign key (national_Id) references citizen(National_Code) 
-- 	on delete cascade
-- 	on update cascade,
-- 	foreign key (city_Id) references parking(city_Id)
-- 	on delete cascade
-- 	on update cascade
-- );

-- create table services(
-- 	type_service char(11),
-- 	primary key (type_service),
-- 	check (type_service in ('water','gas','electricity'))
	
-- );

-- create table services_usage(
-- 	national_Id char(10),
-- 	type_service char(11),
-- 	foreign key (national_Id) references home_owner(National_Id) 
-- 	on delete cascade
-- 	on update cascade,
-- 	foreign key (type_service) references services(type_service)
-- 	on delete cascade
-- 	on update cascade,
-- 	primary key (national_Id,type_service)
-- );

-- create table requests(
-- 	national_Id char(10),
-- 	type_service char(11),
-- 	foreign key (national_Id) references home_owner(national_Id) 
-- 	on delete cascade
-- 	on update cascade,
-- 	foreign key (type_service) references services(type_service)
-- 	on delete cascade
-- 	on update cascade,
-- 	primary key (national_Id,type_service)
-- );


-- alter table Citizen_Account
-- add constraint x foreign key (Citizen_Id) References Citizen(National_Code)
-- 	on update cascade
-- 	on delete cascade;

-- alter table payment_receipt
-- add constraint y foreign key(citizen_national_code) References Citizen(National_Code)
-- on update cascade
-- on delete set null;


-- alter table car
-- add constraint car_name foreign key(Transpot_Network_Name) References transport_network(Transpot_Network_Name)
-- on update cascade
-- on delete set null;

-- alter table car 
-- 	add constraint car_owner Foreign Key (Car_Owner) References Citizen(National_Code)
-- 	on update cascade
-- 	on delete set null;

-- alter table path
-- 	add constraint path_transport Foreign Key (Transpot_Network_Name) References transport_network(Transpot_Network_Name)
-- 	on update cascade
-- 	on delete cascade;

-- alter table sequence_station
-- 	add constraint first_station Foreign key (First_Station) References station (Station_Name)
-- 	on update cascade
-- 	on delete cascade,
-- 	add constraint second_station Foreign key (Second_Station) References station (Station_Name)
-- 	on update cascade
-- 	on delete cascade;

-- alter table station_R_path
-- 	add constraint path_Id Foreign key (Path_Id) References path (Path_Id)
-- 	on update cascade
-- 	on delete cascade,
-- 	add constraint station_name Foreign key (Station_Name) References station (Station_Name)
-- 	on update cascade
-- 	on delete cascade ;
	
-- alter table travel
-- 	add constraint cicizen_Id Foreign key (Citizen_Id) References citizen (National_Code)
-- 	on update cascade
-- 	on delete set null,
-- 	add constraint car_tag Foreign key (Car_Tag) References car (Tag)
-- 	on update cascade
-- 	on delete set null;

-- alter table city_service_receipt
-- drop column type_of_service;
	
-- alter table city_service_receipt
-- 	add column type_service char(11),
-- 	add column national_Id char(10);


-- alter table city_service_receipt
-- 	Add foreign key (type_service) References services(type_service)
-- 	on update cascade
-- 	on delete cascade,
-- 	add foreign key (national_Id) References home_owner(national_Id)
-- 	on update cascade
-- 	on delete cascade ;
	
-- alter table city_service_receipt
-- 	add constraint foreign_keys_second
-- 	Foreign key (type_service,national_Id) references  services_usage(type_service,national_Id)
-- 	on update cascade
-- 	on delete cascade;	
	
-- alter table parking_receipt
-- 	add column city_Id char(10),
-- 	add column national_Id char(10);
	
-- alter table parking_receipt
-- 	Add foreign key (city_Id) References parking(city_Id)
-- 	on update cascade
-- 	on delete cascade,
-- 	add foreign key (national_Id) References driver_citizen(national_Id)
-- 	on update cascade
-- 	on delete cascade;


-- alter table parking_receipt
-- drop column national_id;

-- alter table parking_receipt
-- add column national_id char(10);

-- alter table parking_receipt
-- 	add foreign key (national_Id) References citizen(national_code)
-- 	on update cascade
-- 	on delete cascade;
	

-- create table driving(
-- 	national_id char(10),
-- 	car_tag char(8),
-- 	Primary Key(national_id, car_tag),
-- 	Foreign key (national_id) References citizen(national_code),
-- 	Foreign Key (car_tag) References car(tag)

-- );

-- drop table station_r_path;
-- drop table sequence_station;
-- drop table station;

-- create table station(
-- 	station_id char(10) Primary Key,
-- 	station_name varchar(20),
-- 	x_location integer,
-- 	y_location integer,
-- 	unique(x_location, y_location)
-- );

-- create table station_r_path(
-- 	path_id varchar(20),
-- 	station_id char(10),
-- 	primary key(path_id, station_id),
-- 	foreign key (path_id) references path(path_id)
-- 	on delete cascade
-- 	on update cascade,
-- 	foreign key (station_id) references station(station_id)
-- 	on delete cascade
-- 	on update cascade
	
-- );

-- create table station_sequence(
-- 	first_station_id char(10) Primary Key,
-- 	second_station_id char(10) unique,
-- 	foreign key (first_station_id) references station(station_id)
-- 	on delete cascade
-- 	on update cascade,
-- 	foreign key (second_station_id) references station(station_id)
-- 	on delete cascade
-- 	on update cascade
	
-- );


-- alter table station_sequence
-- add column distance int;

-- alter table station_sequence
-- add column period_of_time int;

-- alter table payment_receipt
-- add column service_used varchar(20)
-- check(service_used in ('travel','parking', 'city_service'))


-- drop table parking_receipt;

-- create table parking_usage(
-- 	arrival_time timestamp,
-- 	national_code char(10),
-- 	parking_city_id char(10),
-- 	primary key(national_code, arrival_time),
-- 	foreign key(national_code) references citizen(national_code)
-- 	on delete cascade
-- 	on update cascade,
-- 	foreign key (parking_city_id) references parking(city_id)
-- 	on delete set null
-- 	on update cascade                 

-- );

-- create table parking_receipt(
-- 	arrival_time timestamp,
-- 	departure_time timestamp,
-- 	national_code char(10),
-- 	parking_receipt_id char(10) primary key,
-- 	foreign key (national_code, arrival_time) references parking_usage(national_code, arrival_time)
-- 	on delete cascade
-- 	on update cascade
-- );


alter table driving
	add column driving_time timestamp,
	add column covered_distance int
	check (covered_distance > 0);

