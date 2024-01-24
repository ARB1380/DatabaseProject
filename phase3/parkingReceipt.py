from baseModel import *
from citizen import *
from parking import *


class ParkingReceipt(BaseModel):
    parking_receipt_id = FixedCharField(max_length=10, primary_key=True)
    parking_city_id = ForeignKeyField(Parking)
    citizen_national_code = ForeignKeyField(Citizen)
    arrival_time = DateTimeField()
    departure_time = DateTimeField()

    class Meta:
        primary_key = CompositeKey('citizen_national_code', 'arrival_time')
