from baseModel import *
from citizen import *
from parking import *


class DrivingCitizen(BaseModel):
    citizen_national_code = ForeignKeyField(Citizen)
    parking_city_id = ForeignKeyField(Parking)
