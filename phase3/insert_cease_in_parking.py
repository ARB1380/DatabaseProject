from parking import *
from citizenAccount import *
from parkingReceipt import *
from peewee import *
import datetime
import math

class InsertCeaseInParkingCommands:

    def execute(self, args):

        timestamp1_str = args.arrival_time
        timestamp2_str = args.departure_time

        timestamp_format = "%Y-%m-%d#%H:%M:%S"
        timestamp1 = datetime.datetime.strptime(timestamp1_str, timestamp_format)
        timestamp2 = datetime.datetime.strptime(timestamp2_str, timestamp_format)

        time_difference = timestamp2 - timestamp1
        hour_difference = math.ceil(time_difference.total_seconds() / 3600)
        parking = Parking.select().where(Parking.city_id == args.parking_city_id).get()
        hour_cost = parking.hourly_cost
        cost = hour_difference * hour_cost

        query1 = ParkingReceipt.insert(parking_receipt_id = args.parking_receipt_id, parking_city_id = args.parking_city_id,
                                       citizen_national_code = args.citizen_national_code, arrival_time =args.arrival_time,
                                       departure_time = args.departure_time)

        query2 = CitizenAccount.update(credit = CitizenAccount.credit - cost)
        query2 = query2.where(CitizenAccount.citizen_id == args.citizen_national_code)
        query1.execute()
        query2.execute()

        
