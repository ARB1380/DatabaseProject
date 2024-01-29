from paymentReceipt import *

class SelectCitizenWithConditionCommand:

    def execute(self, args):
        for payment in PaymentReceipt.select().where(PaymentReceipt.payable_amount >= args.a ,
                                                     PaymentReceipt.payable_amount < args.b ,
                                                      PaymentReceipt.time_of_issue >= args.time_of_issue,
                                                     PaymentReceipt.end_time_of_issue <= args.end_time_of_issue) :
            print(payment.citizen_national_code)


    