from citizen import *

class CitizenSearch:
  def execute(self,args):
    result = Citizen.select().where(
        (Citizen.first_name == args.first_name) & (Citizen.last_name == args.last_name)
    )
    return result
