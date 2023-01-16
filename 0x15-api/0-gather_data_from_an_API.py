#!/usr/bin/python3
"""
Using https://jsonplaceholder.typicode.com
returns info about employee TODO progress
Implemented using recursion
"""
import json
from sys import argv
import requests

API = "https://jsonplaceholder.typicode.com"


if __name__ == "__main__":
    user = requests.get(f'{API}/users/{argv[1]}').json()
    todos = requests.get(f'{API}/todos', params={"userId": argv[1]}).json()
    total_tasks = len(todos)
    completed = 0
    completed_tasks = []
    for todo in todos:
        if todo["completed"]:
            completed += 1
            completed_tasks.append(todo["title"])

    output = f'Employee {user["name"]} is\
done with tasks ({completed}/{total_tasks}):'
    print(output)
    for task in completed_tasks:
        print(f'\t {task}')
