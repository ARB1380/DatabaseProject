from baseModel import *


class Parking(BaseModel):
    city_id = FixedCharField(max_length=10, primary_key=True)
    parking_name = CharField(max_length=100)
    arrival_time = TimeField()
    departure_time = TimeField()
    x_location = IntegerField()
    y_location = IntegerField()
    hourly_cost = IntegerField(constraints=[Check("hourly_cost > 0")])

    class Meta:
        constraints = [Check("arrival_time < departure_time "), SQL("unique (x_location,y_location)")]
