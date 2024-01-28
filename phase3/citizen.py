from baseModel import *


class Citizen(BaseModel):
    first_name = CharField(max_length=20)
    last_name = CharField(max_length=20)
    birth_date = DateField()
    gender = FixedCharField(max_length=1,constraints=[Check("gender in ('F','M')")])
    national_code = FixedCharField(max_length=10, primary_key=True)
    overseer_citizen_id = ForeignKeyField('self',null=True)



