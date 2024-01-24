from baseModel import *


class TransportNetwork(BaseModel):
    transport_network_name = CharField(max_length=10, primary_key=True, constraints=[Check("transport_network_name in ('taxi','metro','bus')")])
    cost_per_kilometer = IntegerField(constraints=[Check("cost_per_kilometer > 0")])
    