from paymentReceipt import *

class SelectCitizenWithConditionCommand:

    def execute(self, args):
        for payment in PaymentReceipt.select().where(payment.payable_amount >= args.a ,
                                                     payment.payable_amount < args.b ,
                                                      payment.time_of_issue >= args.time_of_issue,
                                                     payment.end_time_of_issue <= args.end_time_of_issue) :
            print(payment.citizen_national_code)


    