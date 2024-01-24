from baseModel import *


class Station(BaseModel):
    station_id = FixedCharField(max_length=10, primary_key=True)
    station_name = CharField(max_length=20)
    x_location = IntegerField()
    y_location = IntegerField()

    class Meta:
        constraints = ["unique('x_location,y_location')"]