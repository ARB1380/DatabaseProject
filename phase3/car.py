from baseModel import *
from citizen import *
from transportnetwork import *


class Car(BaseModel):
    tag = FixedCharField(max_length=8, primary_key=True)
    color = CharField(max_length= 15)
    chassis_number = FixedCharField(max_length=17, unique=True)
    brand = CharField(max_length=20)
    transport_network_name = ForeignKeyField(TransportNetwork, null=True)
    car_owner_national_id = ForeignKeyField(Citizen, null=True)
