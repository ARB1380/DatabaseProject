from baseModel import *
from citizen import *
from station import *
from car import *


class Travel(BaseModel):
    traveller_national_code = ForeignKeyField(Citizen)
    car_tag = ForeignKeyField(Car)
    origin_id = ForeignKeyField(Station)
    destination_id = ForeignKeyField(Station)
    travel_date = DateTimeField()

    class Meta:
        primary_key = CompositeKey('traveller_national_code','car_tag', 'travel_date')



