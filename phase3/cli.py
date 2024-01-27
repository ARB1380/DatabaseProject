import argparse
from create_data_base_command import *


class CLI:

    def __init__(self):
        self.parser = argparse.ArgumentParser()
        self.subparsers = self.parser.add_subparsers()
        create_db_parser = self.subparsers.add_parser('create_database', help='Create database')
        create_db_parser.add_argument('--database', type=str, help='Database name')
        create_db_parser.add_argument('--username', type=str, help='Database username')
        create_db_parser.add_argument('--password', type=int, help='Database password')
        create_db_parser.set_defaults(command=CreateDatabaseCommand())


    def run(self):
        args = self.parser.parse_args()
        if hasattr(args, 'command'):
            args.command.execute(args)
        else:
            self.parser.print_help()


cli = CLI()
cli.run()




# pg_db = PostgresqlDatabase('phase3',user = 'postgres',password = '12345678')
# pg_db.connect()
# print("connected to the database.")
# pg_db.close()