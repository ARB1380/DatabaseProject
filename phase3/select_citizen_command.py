from citizen import *

class SelectCitizenCommand:

    def execute(self, args):
        citizen = Citizen.select().where(Citizen.national_code == args.national_code).get()
        print(f"citizen national code : {citizen.national_code}")
        print(f"citizen first name : {citizen.first_name}")
        print(f"citizen last name : {citizen.last_name}")
        print(f"citizen birth date : {citizen.birth_date}")
        print(f"citizen gender : {citizen.gender}")
        print(f"citizen overseer national code: {citizen.overseer_citizen_id}")
