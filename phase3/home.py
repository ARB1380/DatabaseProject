from baseModel import *
from homeOwner import *


class Home(BaseModel):
    city_id = FixedCharField(max_length=10)
    address = CharField(max_length=200)
    x_location = IntegerField()
    y_location = IntegerField()
    home_owner_national_id = ForeignKeyField(HomeOwner, null=True)
    
    class Meta:
        constraints = ["unique('x_location,y_location')"]
