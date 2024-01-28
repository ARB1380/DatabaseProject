from station import *
class SelectStationCommand:
    def execute(self, args):
        station = Station.select().where(Station.station_id == args.station_id).get()
        print(f"station station id : {station.station_id}")
        print(f"station station name : {station.station_name}")
        print(f"station x location : {station.x_location}")
        print(f"station y location : {station.y_location}")
