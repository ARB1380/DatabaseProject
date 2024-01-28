
from parking import *

class UpdateParkingCommands:

    def execute(self, args):
        query = None
        if args.parking_name != 'null':
            query = Parking.update(parking_name = args.parking_name)
        if args.arrival_time != 'null':
            query = Parking.update(arrival_time = args.arrival_time)
        if args.departure_time != 'null':
            query = Parking.update(departure_time = args.departure_time)
        if args.x_location != 'null':
            query = Parking.update(x_location = args.x_location)
        if args.y_location != 'null':
            query = Parking.update(y_location = args.y_location)
        if args.cost != 'null':
            query = Parking.update(hourly_cost = args.cost)


        query = query.where(Parking.city_id == args.city_id)
        query.execute()