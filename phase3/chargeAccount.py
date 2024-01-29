from citizenAccount import *

class ChargeAccount:


  def execute(self,args):
    query = CitizenAccount.update(credit = CitizenAccount.credit + args.amount)
    query = query.where(CitizenAccount.citizen_id == args.national_code)
    query.execute()
