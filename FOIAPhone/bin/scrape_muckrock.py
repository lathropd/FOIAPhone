"""
This is just to get the MuckRock agency and jurisdiction lists in an effort to make sure I can keep compatability with
Muckrock requests in the future. Just having these stashed away for later make me feel better since I know we'll
eventually be wanting them.

It would probably be great to normalize these to something from Censys of Local government agencies or whatever, but
one thing at a time, right?


Agency columns (MuckRock column "types" omitted from this)
"id","name","slug","status","exempt","requires_proxy","jurisdiction","parent","appeal_agency"

Jurisdiction columns: 
"id","name","slug","abbrev","level","parent"

"""
from urllib.request import urlopen
import json
import csv
import time
import random

def get_json(url):
    with urlopen(url) as response:
        content = response.read()
    content = content.decode('utf-8')
    return json.loads(content)
    

def loop(url, writer):
    # important keys are ["next"] and ["results"]
    print(url)
    obj = get_json(url)
    time.sleep(random.randrange(1,3)) # wait 1 to 2 seconds per API hit
    for result in obj["results"]:
        vals = list(result.values())
        # the agencies API has a list element which ends up being in the sixth column. Omitting it.
        if type(vals[5]) == list:
            vals.pop(5)
        writer.writerow(vals)
    if obj["next"]:
        try:
            loop(obj["next"], writer)
        except:
            print("failed to get 'next' url")

agencies_url = "https://www.muckrock.com/api_v2/agencies/?format=json&page_size=100"
with open('muckrock-agencies.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    loop(agencies_url, writer)



jurisdictions_url = "https://www.muckrock.com/api_v2/jurisdictions/?format=json&page_size=100"
with open('muckrock-jurisdictions.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    loop(jurisdictions_url, writer)



