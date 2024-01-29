import argparse
from create_data_base_command import *
from create_tables_command import *
from insert_citizen_command import *
from insert_car_command import *
from insert_station_command import *
from insert_parking_command import *
from select_citizen_command import *
from select_station_command import *
from select_parking_command import *
from select_car_command import *
from delete_citizen_command import *
from delete_station_command import *
from delete_parking_command import *
from delete_car_command import *
from update_citizen_commands import *
from update_station_commands import *
from update_parking_commands import *
from update_car_commands import *
from insert_cease_in_parking import *
from select_and_filter_receipt import *
from select_citizen_with_condition import *
from CitizenSearch import *
from chargeAccount import *


class CLI:

    def __init__(self):
        self.parser = argparse.ArgumentParser()
        self.subparsers = self.parser.add_subparsers()
        create_db_parser = self.subparsers.add_parser('create_database', help='Create database')
        create_db_parser.add_argument('--database', type=str, help='Database name')
        create_db_parser.set_defaults(command=CreateDatabaseCommand())

        create_tables_parser = self.subparsers.add_parser('create_tables', help= 'Create required tables')
        create_tables_parser.add_argument('--database', type = str, help='Database name')
        create_tables_parser.set_defaults(command=CreateTablesCommand())

        insert_citizen_parser = self.subparsers.add_parser('insert_citizen', help = 'Insert a citizen')
        insert_citizen_parser.add_argument('--national_code', type=str,help='national code')
        insert_citizen_parser.add_argument('--first_name', type=str, help='first name')
        insert_citizen_parser.add_argument('--last_name', type=str, help='last name')
        insert_citizen_parser.add_argument('--birth_date', type=str, help='birth date')
        insert_citizen_parser.add_argument('--gender', type=str, help='gender')
        insert_citizen_parser.add_argument('--overseer', type=str, help='national code')
        insert_citizen_parser.set_defaults(command=InsertCitizenCommand())

        insert_car_parser = self.subparsers.add_parser('insert_car', help = 'Insert a car')
        insert_car_parser.add_argument('--tag', type=str,help='tag')
        insert_car_parser.add_argument('--color', type=str, help='color')
        insert_car_parser.add_argument('--chassis', type=str, help='chassis')
        insert_car_parser.add_argument('--brand', type=str, help='brand')
        insert_car_parser.add_argument('--transport_name', type=str, help='transport name')
        insert_car_parser.add_argument('--owner', type=str, help='owner')
        insert_car_parser.set_defaults(command=InsertCarCommand())

        insert_station_parser = self.subparsers.add_parser('insert_station', help = 'Insert a station')
        insert_station_parser.add_argument('--station_id', type=str,help='station id')
        insert_station_parser.add_argument('--station_name', type=str, help='station name')
        insert_station_parser.add_argument('--x_location', type=str, help='x location')
        insert_station_parser.add_argument('--y_location', type=str, help='y location')
        insert_station_parser.set_defaults(command=InsertStationCommand())

        insert_parking_parser = self.subparsers.add_parser('insert_parking', help = 'Insert a parking')
        insert_parking_parser.add_argument('--city_id', type=str,help='city id')
        insert_parking_parser.add_argument('--parking_name', type=str, help='parking name')
        insert_parking_parser.add_argument('--arrival_time', type=str, help='arrival time')
        insert_parking_parser.add_argument('--departure_time', type=str, help='departure time')
        insert_parking_parser.add_argument('--x_location', type=str, help='x location')
        insert_parking_parser.add_argument('--y_location', type=str, help='y location')
        insert_parking_parser.add_argument('--cost', type=str, help='cost')
        insert_parking_parser.set_defaults(command=InsertParkingCommand())

        select_citizen__parser = self.subparsers.add_parser('select_citizen', help = 'Select a citizen')
        select_citizen__parser.add_argument('--national_code', type=str,help='national code')
        select_citizen__parser.set_defaults(command=SelectCitizenCommand())

        select_station__parser = self.subparsers.add_parser('select_station', help = 'Select a station')
        select_station__parser.add_argument('--station_id', type=str,help='station id')
        select_station__parser.set_defaults(command=SelectStationCommand())

        select_parking__parser = self.subparsers.add_parser('select_parking', help = 'Select a parking')
        select_parking__parser.add_argument('--city_id', type=str,help='city id')
        select_parking__parser.set_defaults(command=SelectParkingCommand())

        select_car__parser = self.subparsers.add_parser('select_car', help = 'Select a car')
        select_car__parser.add_argument('--tag', type=str,help='car tag')
        select_car__parser.set_defaults(command=SelectCarCommand())

        delete_citizen__parser = self.subparsers.add_parser('delete_citizen', help = 'delete a citizen')
        delete_citizen__parser.add_argument('--national_code', type=str,help='national code')
        delete_citizen__parser.set_defaults(command=DeleteCitizenCommand())

        delete_station__parser = self.subparsers.add_parser('delete_station', help = 'delete a station')
        delete_station__parser.add_argument('--station_id', type=str,help='station id')
        delete_station__parser.set_defaults(command=DeleteStationCommand())

        delete_parking__parser = self.subparsers.add_parser('delete_parking', help = 'delete a parking')
        delete_parking__parser.add_argument('--city_id', type=str,help='city id')
        delete_parking__parser.set_defaults(command=DeleteParkingCommand())

        delete_car__parser = self.subparsers.add_parser('delete_car', help = 'delete a car')
        delete_car__parser.add_argument('--tag', type=str,help='tag')
        delete_car__parser.set_defaults(command=DeleteCarCommand())

        update_citizen__parser = self.subparsers.add_parser('update_citizen', help = 'update a citizen')
        update_citizen__parser.add_argument('--national_code', type=str,help='national code')
        update_citizen__parser.add_argument('--first_name', type=str, help='first name')
        update_citizen__parser.add_argument('--last_name', type=str, help='last name')
        update_citizen__parser.add_argument('--birth_date', type=str, help='birth date')
        update_citizen__parser.add_argument('--gender', type=str, help='gender')
        update_citizen__parser.add_argument('--overseer', type=str, help='national code')
        update_citizen__parser.set_defaults(command=UpdateCitizenCommands())

        update_station_parser = self.subparsers.add_parser('update_station', help = 'Update a station')
        update_station_parser.add_argument('--station_id', type=str,help='station id')
        update_station_parser.add_argument('--station_name', type=str, help='station name')
        update_station_parser.add_argument('--x_location', type=str, help='x location')
        update_station_parser.add_argument('--y_location', type=str, help='y location')
        update_station_parser.set_defaults(command=UpdateStationCommands())

        update_parking_parser = self.subparsers.add_parser('update_parking', help = 'Insert a parking')
        update_parking_parser.add_argument('--city_id', type=str,help='city id')
        update_parking_parser.add_argument('--parking_name', type=str, help='parking name')
        update_parking_parser.add_argument('--arrival_time', type=str, help='arrival time')
        update_parking_parser.add_argument('--departure_time', type=str, help='departure time')
        update_parking_parser.add_argument('--x_location', type=str, help='x location')
        update_parking_parser.add_argument('--y_location', type=str, help='y location')
        update_parking_parser.add_argument('--cost', type=str, help='cost')
        update_parking_parser.set_defaults(command=UpdateParkingCommands())

        update_car_parser = self.subparsers.add_parser('update_car', help = 'Update a car')
        update_car_parser.add_argument('--tag', type=str,help='tag')
        update_car_parser.add_argument('--color', type=str, help='color')
        update_car_parser.add_argument('--chassis', type=str, help='chassis')
        update_car_parser.add_argument('--brand', type=str, help='brand')
        update_car_parser.add_argument('--owner', type=str, help='owner')
        update_car_parser.set_defaults(command=UpdateCarCommands())

        insert_cease_in_parking__parser = self.subparsers.add_parser('insert_cease_in_parking', help='insert cease in parking')

        insert_cease_in_parking__parser.add_argument('--arrival_time', type=str, help = 'arrival time')
        insert_cease_in_parking__parser.add_argument('--departure_time', type=str, help = 'departure time')
        insert_cease_in_parking__parser.add_argument('--parking_city_id', type=str , help= 'parking city id')
        insert_cease_in_parking__parser.add_argument('--parking_receipt_id', type=str, help = 'parking receipt id')
        insert_cease_in_parking__parser.add_argument('--citizen_national_code', type=str, help = 'national code')
        insert_cease_in_parking__parser.set_defaults(command=InsertCeaseInParkingCommands())

        select_and_filter_receipt__parser = self.subparsers.add_parser('filter_receipt', help = 'filter receipt')
        select_and_filter_receipt__parser.add_argument('--service_used', type=str, help= 'service used')
        select_and_filter_receipt__parser.add_argument('--citizen_national_code', type=str, help='citizen national code')
        select_and_filter_receipt__parser.add_argument('--time_of_issue', type=str, help= 'time of issue')
        select_and_filter_receipt__parser.add_argument('--end_time_of_issue', type=str, help='end time of issue')
        select_and_filter_receipt__parser.set_defaults(command=SelectAndFilterReceiptCommand())

        select_citizen_with_condition__parser = self.subparsers.add_parser('select_citizen_with_condition', help = 'select citizen with condition')
        select_citizen_with_condition__parser.add_argument('--a', type=str, help= 'first amount')
        select_citizen_with_condition__parser.add_argument('--b', type=str, help = 'second amount')
        select_citizen_with_condition__parser.add_argument('--time_of_issue', type=str, help='time of issue')
        select_citizen_with_condition__parser.add_argument('--end_time_of_issue', type=str, help= 'end time of issue')
        select_citizen_with_condition__parser.set_defaults(command = SelectCitizenWithConditionCommand())

        search_citizen__parser = self.subparsers.add_parser('search_citizen', help = 'search citizen')
        search_citizen__parser.add_argument('--first_name', type=str, help= 'first name')
        search_citizen__parser.add_argument('--last_name', type=str, help = 'last name')
        search_citizen__parser.set_defaults(command = CitizenSearch())

        charge_citizen__parser = self.subparsers.add_parser('charge_citizen', help = 'charge citizen')
        charge_citizen__parser.add_argument('--national_code', type=str, help= 'national code')
        charge_citizen__parser.add_argument('--amount', type=str, help = 'amount')
        charge_citizen__parser.set_defaults(command = ChargeAccount())





        




    def run(self):
        args = self.parser.parse_args()
        if hasattr(args, 'command'):
            args.command.execute(args)
        else:
            self.parser.print_help()


cli = CLI()
cli.run()




