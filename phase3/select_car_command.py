from car import *

class SelectCarCommand:

    def execute(self, args):
        car = Car.select().where(Car.tag == args.tag).get()
        print(f"car tag: {car.tag}")
        print(f"car color : {car.color}")
        print(f"car chassis number : {car.chassis_number}")
        print(f"car brand: {car.brand}")
        print(f"car transport network name : {car.transport_network_name}")
        print(f"car owner national code : {car.car_owner_national_id}")