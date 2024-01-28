
from station import *
class UpdateStationCommands:

    def execute(self, args):
        query = None
        if args.station_name != 'null':
            query = Station.update(station_name = args.station_name)
        if args.x_location != 'null':
            query = Station.update(x_location = args.x_location)
        if args.y_location != 'null':
            query = Station.update(y_location = args.y_location)


        query = query.where(Station.station_id == args.station_id)
        query.execute()