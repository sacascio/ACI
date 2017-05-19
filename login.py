#!/usr/bin/env python
import json
import requests

# Created by Salvatore Cascio (sacascio)
# May 16, 2017
# U: MAY 19
headers = {'Content-type': 'application/json'}
url = 'https://192.168.29.133/api/aaaLogin.json'

pay =  { "aaaUser" : { "attributes": {"name":"admin","pwd":"admin12345"} } }
payload =  json.dumps(pay)

response = requests.post(url, data=payload, headers=headers)

print response

# END
