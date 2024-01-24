from baseModel import *
from services import *
from homeOwner import *

class CityServiceReceipt(BaseModel):
    receipt_code = FixedCharField(max_length=10, primary_key=True)
    citizen_national_code = ForeignKeyField(HomeOwner)
    service_type = ForeignKeyField(Services)
    usage_date = DateField()
    amount_of_usage = IntegerField(constraints=[Check("amount_of_usage > 0")])

