from baseModel import *
from homeOwner import *
from services import *


class Requests(BaseModel):
    citizen_national_code = ForeignKeyField(HomeOwner)
    type_service = ForeignKeyField(Services)

    class Meta:
        primary_key = CompositeKey('citizen_national_code', 'type_service')
