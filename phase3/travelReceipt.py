from baseModel import *
from citizen import *
from car import *
from travel import *


class TravelReceipt(BaseModel):
    travel_code = FixedCharField(max_length=10, primary_key=True)
    start_time = ForeignKeyField(Travel,to_field='travel_date')
    end_time = DateTimeField()
    traveller_national_code = ForeignKeyField(Travel, to_field='traveller_national_code')
    car_tag = ForeignKeyField(Travel, to_field='car_tag')

    class Meta:
        constrains = [Check('start_time < end_time')]


