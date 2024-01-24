from baseModel import *
from citizen import *


class HomeOwner(BaseModel):
    national_code = ForeignKeyField(Citizen, primary_key=True)
