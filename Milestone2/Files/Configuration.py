#---------- Imports ------------------
import mysql.connector
import datetime
import time

# ----- Connection Credintials ----------
user = "glitch"
password = "123456789"
host = "35.184.20.247"
database = "LMS"

#--- Creating Connection ---------------

cnx = mysql.connector.connect(user=user,
                              password=password,
                              host=host,
                              database=database)

#-----------------others --------------
data_limit_mb = 20
Bot_Token = 'MTEwMTg5NzQ4NjkzNjg0MjMzMg.GeQuu0.FCqSkDKsJZznHXbF0OU0nlojsN2QfwX9xT2Scs'
