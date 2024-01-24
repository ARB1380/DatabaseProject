from baseModel import *
from transportnetwork import *


class Path(BaseModel):
    path_id = FixedCharField(max_length=10, primary_key=True)
    transport_network_name = ForeignKeyField(TransportNetwork)
    path_name = CharField(max_length=20)