# importing packages
import psycopg2
import random
import names
import datetime

def randomDate():
	start_dt = datetime.date(1978, 1, 1)
	end_dt = datetime.date(2023, 12, 30)
	time_between_dates = end_dt - start_dt
	days_between_dates = time_between_dates.days
	random_number_of_days = random.randrange(days_between_dates)
	random_date = start_dt + datetime.timedelta(days=random_number_of_days)
	print(random_date)
	return random_date

# forming connection
conn = psycopg2.connect(
	database="postgres",
	user='postgres',
	password='tardast2020',
	host='127.0.0.1',
	port='5432'
)

conn.autocommit = True

# creating a cursor
cursor = conn.cursor()

# list of rows to be inserted
for i in range(5):
	fname = names.get_first_name(gender='male')
	lname = names.get_last_name()
	birthday = randomDate()
	gender = 'M'
	nationalCode = random.randrange(1000000000, 10000000000)
	overseerCitizenId = '8209811214'
	print(nationalCode)

	values = [(fname, lname, birthday, gender, nationalCode, overseerCitizenId)]

# cursor.mogrify() to insert multiple values

	args = ','.join(cursor.mogrify("(%s,%s,%s,%s,%s,%s)", i).decode('utf-8')
				for i in values)

# executing the sql statement
	cursor.execute("INSERT INTO citizen VALUES " + (args))

# select statement to display output
sql1 = '''select * from citizen;'''

# executing sql statement
cursor.execute(sql1)

# fetching rows
for i in cursor.fetchall():
	print(i)

# committing changes
conn.commit()

# closing connection
conn.close()
