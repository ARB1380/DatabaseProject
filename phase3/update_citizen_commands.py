from citizen import *


class UpdateCitizenCommands:

    def execute(self, args):
        query = None
        if args.first_name != 'null':
            query = Citizen.update(first_name = args.first_name)
        if args.last_name != 'null':
            query = Citizen.update(last_name = args.last_name)
        if args.birth_date != 'null':
            query = Citizen.update(birth_date = args.birth_date)

        if args.gender != 'null':
            query = Citizen.update(gender = args.gender)

        if args.overseer != 'null':
            query = Citizen.update(overseer_citizen_id = args.overseer)

        query = query.where(Citizen.national_code == args.national_code)
        query.execute()




