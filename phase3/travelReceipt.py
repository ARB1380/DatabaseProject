from baseModel import *
from citizen import *
from car import *
from travel import *
from station import *


class TravelReceipt(BaseModel):
    travel_code = FixedCharField(max_length=10, primary_key=True)
    start_time = DateTimeField()
    end_time = DateTimeField()
    origin_id = ForeignKeyField(Station)
    destination_id = ForeignKeyField(Station)
    traveller_national_code = ForeignKeyField(Citizen)
    car_tag = ForeignKeyField(Car)


    class Meta:
        constraints = [SQL("unique(traveller_national_code_id,start_time,car_tag_id)")]


