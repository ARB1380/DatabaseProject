from baseModel import *
from citizen import *
import datetime


class PaymentReceipt(BaseModel):
    receipt_code = FixedCharField(max_length=10, primary_key=True)
    payable_amount = IntegerField(constraints=[Check('payable_amount > 0')])
    time_of_issue = DateTimeField(default=datetime.datetime.now())
    service_used = CharField(max_length=20, constraints=[Check("service_used in ('travel','parking', 'city_service')")])
    citizen_national_code = ForeignKeyField(Citizen)
    end_time_of_issue = DateTimeField(default=datetime.datetime.now())
