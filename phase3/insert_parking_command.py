from parking import *
class InsertParkingCommand:

    def execute(self, args):
        query = Parking.insert(city_id = args.city_id, parking_name = args.parking_name, arrival_time = args.arrival_time, departure_time = args.departure_time, x_location = args.x_location, y_location = args.y_location, hourly_cost = args.cost )
        query.execute()
