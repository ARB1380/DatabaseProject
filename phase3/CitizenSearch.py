from citizen import *

class CitizenSearch:
  def execute(self,args):
    # result = Citizen.select().where(
    #     (Citizen.first_name == args.first_name) & (Citizen.last_name == args.last_name)
    # )

    for citizen in Citizen.select().where(
            (Citizen.first_name == args.first_name) & (Citizen.last_name == args.last_name)):
        print(citizen.national_code)
        print(citizen.first_name)
        print(citizen.last_name)
        print(citizen.birth_date)
        print(citizen.gender)
        print(citizen.overseer_citizen_id)


