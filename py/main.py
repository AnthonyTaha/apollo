import sqlite3

db = sqlite3.connect('projet.db')
cursor = db.cursor()
running = True
tables = sorted(['Batteries','Employees','Jobs','Clients','Panels'])

def show(params):
    table = params.lower().capitalize()
    if table in tables:
        cursor.execute("SELECT * FROM {t}".format(t=table))
        print(cursor.fetchall())
    else:
        print("Table non existant.\nSelect from following:\n",tables)

def addBattery(capacity,price):
    cursor.execute("INSERT INTO Batteries(batteryCapacity, batteryPrice) VALUES (?,?)",(capacity,price))
    db.commit()

def add(table):
    table = table.lower().capitalize()
    if table in tables:
        if table == "Batteries":
            capacity = float(input("Capacity: "))
            price = float(input("Price: "))
            addBattery(capacity,price)
    else:
        print("Table non existant.\nSelect from following:\n",tables)

def do():
    global running
    inp = str(input()).upper().split(" ")
    if inp[0] == "EXIT":
        running = False
    elif inp[0] == "SHOW":
        if len(inp) > 1:
            show(inp[1])
        else:
            print("Error: Specify table to show.")
    elif inp[0] == "ADD":
        if len(inp) > 1:
            add(inp[1])
        else:
            print("Error: Specify item to add.")
while running:
    do()
db.close()
