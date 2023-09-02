#!/usr/bin/env python

import json

with open("gis_mso_json") as f:
                data = json.load(f)

for d in data['schemas']:
    template = d['displayName']
    v = []
    for dd in d['sites']:
        sid = dd['siteId']
        if len(v) == 0:
            v.append(sid)
            continue

        if sid in v:
            pass
        else: 
            print template
