from peewee import *


class BaseModel(Model):

    class Meta:
        database = PostgresqlDatabase('test6',user = 'postgres',password = '12345678')