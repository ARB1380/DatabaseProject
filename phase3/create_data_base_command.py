import psycopg2


class CreateDatabaseCommand:

    def execute(self, args):
        conn = psycopg2.connect(host='localhost', user=args.username, password=args.password)
        conn.autocommit = True
        conn.cursor().execute(f'CREATE DATABASE {args.database}')
        conn.cursor().close()
        conn.close()






