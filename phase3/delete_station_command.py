
from station import *
class DeleteStationCommand:

    def execute(self, args):
        query = Station.delete()
        query = query.where(Station.station_id == args.station_id)
        query.execute()
        print("deleted successfully!")