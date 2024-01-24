from baseModel import *
from station import *


class StationSequence(BaseModel):
    first_station_id = ForeignKeyField(Station)
    second_station_id = ForeignKeyField(Station)
    distance = IntegerField(constraints=[Check('distance > 0')])
    period_of_time = TimeField()

    class Meta:
        primary_key = CompositeKey('first_station_id', 'second_station_id')


