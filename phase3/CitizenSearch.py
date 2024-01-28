from citizen import *

class CitizenSearch:
  def search_by_name(self,first_name,last_name):
    result = Citizen.select().where(
        (Citizen.first_name == first_name) & (Citizen.last_name == last_name)
    )
    return result
