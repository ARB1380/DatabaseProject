from baseModel import *
from station import *
from path import *


class StationRPath(BaseModel):
    path_id = ForeignKeyField(Path)
    station_id = ForeignKeyField(Station)

    class Meta:
        primary_key = CompositeKey('path_id', 'station_id')