from parking import *
from citizenAccount import *
from parkingReceipt import *
from peewee import *

class InsertCeaseInParkingCommands:

    def execute(self, args):
        query = Parking.select(fn.TIMEDIFF(args.departure_time, args.arrival_time)) 
        differentTime = query.scalar()
        print(differentTime)
        cost = differentTime * args.hourly_cost
        new_credit = CitizenAccount.credit - cost
        
        query1 = Parking.insert(city_id = args.city_id, parking_name = args.parking_name, arrival_time =args.arrival_time,
                                departure_time = args.departure_time, x_location = args.x_location, y_location = args.y_location
                                , hourly_cost = args.hourly_cost)
        query2 = ParkingReceipt.insert(parking_receipt_id = args.parking_receipt_id, parking_city_id = args.city_id,
                                       citizen_national_code = args.national_code, arrival_time =args.arrival_time,
                                       departure_time = args.departure_time)
        query3 = CitizenAccount.update(credit = new_credit)

        query3 = query3.where(CitizenAccount.citizen_id == args.national_code)
        print(args.hourly_cost.date)
        query1.execute
        query2.execute
        query3.execute
        query.execute
        
