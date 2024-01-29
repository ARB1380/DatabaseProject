from citizenAccount import *

class ChargeAccount:
  # def charge_account(self,amount,citizen_account):
  #   citizen_account.credit += amount
  #   citizen_account.save()


  def execute(self,args):
    query = CitizenAccount.update(credit = CitizenAccount.credit + args.amount)
    query = query.where(CitizenAccount.citizen_id == args.national_code)
    query.execute()
