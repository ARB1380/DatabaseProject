import psycopg2
from peewee import *
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
from baseModel import *

class CreateTablesCommand:
    db = None

    def execute(self, args):
        pg_db = PostgresqlDatabase(args.database, user=args.username, password=args.password)
        self.db = pg_db
        pg_db.connect()
        pg_db.create_tables([Citizen, CitizenAccount, Parking, HomeOwner, DrivingCitizen, TransportNetwork, Station, Path, Home, Services, Requests, StationRPath, PaymentReceipt, CityServiceReceipt, StationSequence, Car, Driving, ParkingReceipt, TravelReceipt])
        pg_db.close()