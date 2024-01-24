from peewee import *


class BaseModel(Model):

    class Meta:
        database = PostgresqlDatabase('phase3',user = 'postgres',password = '12345678')