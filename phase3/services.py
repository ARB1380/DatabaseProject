from baseModel import *


class Services(BaseModel):
    type_service = CharField(max_length=11, constraints=[Check("type_service in ('water','gas','electricity')")], primary_key=True)
