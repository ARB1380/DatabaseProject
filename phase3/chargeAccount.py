from citizenAccount import *

class ChargeAccount:
  def charge_account(self,amount,citizen_account):
    citizen_account.credit += amount
    citizen_account.save()