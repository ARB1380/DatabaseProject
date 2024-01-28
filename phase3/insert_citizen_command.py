from peewee import *
from citizen import *

class InsertCitizenCommand:


    def execute(self, args):

        overseer = args.overseer
        if overseer == 'null':
            overseer = args.national_code

        query = Citizen.insert(national_code = args.national_code, first_name = args.first_name, last_name = args.last_name, birth_date = args.birth_date, gender = args.gender, overseer_citizen_id = overseer)
        query.execute()
