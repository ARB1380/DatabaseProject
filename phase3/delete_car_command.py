from car import *

class DeleteCarCommand:

    def execute(self, args):
        query = Car.delete()
        query = query.where(Car.tag == args.tag)
        query.execute()
        print("deleted successfully!")