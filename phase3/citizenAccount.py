from baseModel import *
from citizen import *


class CitizenAccount(BaseModel):
    citizen_id = ForeignKeyField(Citizen, null=False)
    credit = IntegerField() 
    payment = IntegerField()
    deposit = IntegerField()

