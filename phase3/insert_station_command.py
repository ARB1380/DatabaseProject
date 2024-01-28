from station import *

class InsertStationCommand:

    def execute(self, args):
        query = Station.insert(station_id = args.station_id, station_name = args.station_name, x_location = args.x_location, y_location = args.y_location)
        query.execute()
