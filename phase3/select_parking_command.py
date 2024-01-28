from parking import *

class SelectParkingCommand:

    def execute(self, args):
        parking = Parking.select().where(Parking.city_id == args.city_id).get()
        print(f"parking city id : {parking.city_id}")
        print(f"parking name : {parking.parking_name}")
        print(f"arrival time : {parking.arrival_time}")
        print(f"departure time : {parking.departure_time}")
        print(f"parking x_location : {parking.x_location}")
        print(f"parking y_location : {parking.y_location}")
        print(f"parking hourly cost : {parking.hourly_cost}")
