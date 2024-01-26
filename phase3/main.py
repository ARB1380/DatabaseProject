from peewee import *
import psycopg2
from citizen import *
from citizenAccount import *
from parking import *
from transportnetwork import *
from station import *
from homeOwner import *
from drivingCitizen import *
from path import *
from home import *
from driving import *
from services import *
from cityServiceReceipt import *
from parkingReceipt import *
from requests import *
from stationRPath import *
from paymentReceipt import *
from StationSequence import *
from car import *
from travelReceipt import *
from driving import *


#create a database for phase 3

# conn = psycopg2.connect(host='localhost',user = 'postgres', password='12345678')
# conn.autocommit = True
# conn.cursor().execute('CREATE DATABASE phase3')
# conn.cursor().close()
# conn.close()

#connection to the database
pg_db = PostgresqlDatabase('phase3',user = 'postgres',password = '12345678')
pg_db.connect()
# pg_db.create_tables([Citizen])
# pg_db.create_tables([Parking])
# pg_db.create_tables([CitizenAccount])
# pg_db.create_tables([HomeOwner, DrivingCitizen])
# pg_db.create_tables([TransportNetwork, Station])
# pg_db.create_tables([Path, Home, Services])
# pg_db.create_tables([Requests])
# pg_db.create_tables([StationRPath, PaymentReceipt])
# pg_db.create_tables([CityServiceReceipt])
# pg_db.create_tables([StationSequence, Car ])
# pg_db.create_tables([Driving])
# pg_db.create_tables([ParkingReceipt])
# pg_db.create_tables([TravelReceipt])
pg_db.close()