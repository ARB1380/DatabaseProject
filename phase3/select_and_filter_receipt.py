from paymentReceipt import *

class SelectAndFilterReceiptCommand:

    def execute(self, args):
        receipt_type = args.service_used
        citizen = args.citizen_national_code
        start_time = args.time_of_issue
        end_time = args.end_time_of_issue

        if receipt_type != 'null' :
            for type in PaymentReceipt.select().where(PaymentReceipt.service_used == receipt_type):
                print(f"receipt code : {type.receipt_code}")
                print(f"receipt payable_amount : {type.payable_amount}")
                print(f"receipt time_of_issue : {type.time_of_issue}")
                print(f"receipt service_used : {type.service_used}")
                print(f"receipt citizen_national_code : {type.citizen_national_code}")
                print(f"receipt end_time_of_issue : {type.end_time_of_issue}")
        
        if citizen != 'null' :
            for code in PaymentReceipt.select().where(PaymentReceipt.citizen_national_code == citizen):
                print(f"receipt code : {code.receipt_code}")
                print(f"receipt payable_amount : {code.payable_amount}")
                print(f"receipt time_of_issue : {code.time_of_issue}")
                print(f"receipt service_used : {code.service_used}")
                print(f"receipt citizen_national_code : {code.citizen_national_code}")
                print(f"receipt end_time_of_issue : {code.end_time_of_issue}")
        
        if start_time != 'null' :
            for start in PaymentReceipt.select().where(PaymentReceipt.time_of_issue == start_time):
                print(f"receipt code : {start.receipt_code}")
                print(f"receipt payable_amount : {start.payable_amount}")
                print(f"receipt time_of_issue : {start.time_of_issue}")
                print(f"receipt service_used : {start.service_used}")
                print(f"receipt citizen_national_code : {start.citizen_national_code}")
                print(f"receipt end_time_of_issue : {start.end_time_of_issue}")

        if end_time != 'null' :
            for end in PaymentReceipt.select().where(PaymentReceipt.end_time_of_issue == end_time):
                print(f"receipt code : {end.receipt_code}")
                print(f"receipt payable_amount : {end.payable_amount}")
                print(f"receipt time_of_issue : {end.time_of_issue}")
                print(f"receipt service_used : {end.service_used}")
                print(f"receipt citizen_national_code : {end.citizen_national_code}")
                print(f"receipt end_time_of_issue : {end.end_time_of_issue}")