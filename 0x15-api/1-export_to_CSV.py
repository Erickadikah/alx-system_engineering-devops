#!/usr/bin/python3
"""
Using https://jsonplaceholder.typicode.com
returns info about employee TODO progress
Implemented using recursion
"""
import json
from sys import argv
import requests
import csv
API = "https://jsonplaceholder.typicode.com"


if __name__ == "__main__":
    user = requests.get(f'{API}/users/{argv[1]}').json()
    todos = requests.get(f'{API}/todos', params = {"userId" : argv[1]}).json()
    with open(f'{argv[1]}.csv', 'w', encoding='utf8') as f:
        writer = csv.writer(f, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
        for todo in todos:
            writer.writerow([f"{argv[1]}", f'{user["name"]}', f'{str(todo["completed"])}', f'{todo["title"]}'])
