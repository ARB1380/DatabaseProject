from peewee import *
import psycopg2
from citizen import *




#create a database for phase 3

# conn = psycopg2.connect(host='localhost',user = 'postgres', password='12345678')
# conn.autocommit = True
# conn.cursor().execute('CREATE DATABASE phase3')
# conn.cursor().close()
# conn.close()

#connection to the database
pg_db = PostgresqlDatabase('phase3',user = 'postgres',password = '12345678')
pg_db.connect()
pg_db.create_tables([Citizen])
pg_db.close()