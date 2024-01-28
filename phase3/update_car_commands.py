from car import *

class UpdateCarCommands:

    def execute(self, args):
        query = None
        if args.color != 'null':
            query = Car.update(color = args.color)
        if args.chassis != 'null':
            query = Car.update(chassis_number = args.chassis)
        if args.brand != 'null':
            query = Car.update(brand = args.brand)
        if args.owner != 'null':
            query = Car.update(car_owner_national_id = args.owner)
        query = query.where(Car.tag == args.tag)
        query.execute()
