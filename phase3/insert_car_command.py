from car import *


class InsertCarCommand:

    def execute(self, args):
        owner = args.owner
        transport = args.transport_name
        if owner == 'null':
            owner = None
        if transport == 'null':
            transport = None
        query = Car.insert(tag = args.tag, color = args.color, chassis_number = args.chassis, brand = args.brand, transport_network_name = transport, car_owner_national_id = owner)
        query.execute()
