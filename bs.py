import requests
import json
import time
from datetime import date

y = date.today()

x = requests.get("https://services.buildandshoot.com/serverlist.json").json()

with open(f'sl.json', 'w') as f:
    json.dump(x, f)
    f.close()

i = 0
while i != 45:
    with open('sl.json', 'r') as v:
        r = json.load(v)
        with open(f'serverlist_{y}', 'a') as z:
            name = r[i]["name"]
            players_current = r[i]["players_current"]
            gamemode = r[i]["game_mode"]
            country = r[i]["country"]
            maxplayers = r[i]["players_max"]
            
            z.write(f"Server Name: {name}")
            z.write(f"\nAmount of players: {players_current}")
            z.write(f"\nGamemode: {gamemode}")
            z.write(f"\nCountry: {country}")
            z.write(f"\nMax Players: {maxplayers}\n\n")
            
            i = i + 1
        if i == 45:
            z.close()
            time.sleep(86400)
