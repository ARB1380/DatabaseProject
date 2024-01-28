from parking import *

class DeleteParkingCommand:

    def execute(self, args):
        query = Parking.delete()
        query = query.where(Parking.city_id == args.city_id)
        query.execute()
        print("deleted successfully!")