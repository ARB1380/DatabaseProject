from citizen import *
class DeleteCitizenCommand:

    def execute(self, args):
        query = Citizen.delete()
        query = query.where(Citizen.national_code == args.national_code)
        query.execute()
        print("deleted successfully!")
