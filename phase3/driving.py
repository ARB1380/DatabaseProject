from baseModel import *
from car import *
from drivingCitizen import *


class Driving(BaseModel):
    driver_national_code = ForeignKeyField(DrivingCitizen, primary_key=True)
    car_tag = ForeignKeyField(Car)
    covered_distance = IntegerField(constraints=[Check('covered_distance > 0')])
    driving_time = DateTimeField()
    drive_date = DateField()
