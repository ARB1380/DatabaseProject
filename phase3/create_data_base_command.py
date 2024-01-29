import psycopg2


class CreateDatabaseCommand:

    def execute(self, args):
        conn = psycopg2.connect(host='localhost', user='postgres', password='12345678')
        conn.autocommit = True
        conn.cursor().execute(f'CREATE DATABASE {args.database}')
        conn.cursor().close()
        conn.close()






