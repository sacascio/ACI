#!/usr/bin/env python
import json
import requests


# Created by Salvatore Cascio (sacascio)
# May 16, 2017
# U: MAY 19

requests.packages.urllib3.disable_warnings()

headers = {'Content-type': 'application/json'}
url = 'https://10.90.60.174/api/aaaLogin.json'

pay =  { "aaaUser" : { "attributes": {"name":"admin","pwd":"pr@ct1ce"} } }
payload =  json.dumps(pay)

response = requests.post(url, data=payload, headers=headers)

print response

# END
