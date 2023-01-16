#!/usr/bin/python3
"""
Using https://jsonplaceholder.typicode.com
returns info about employee TODO progress
Implemented using recursion
"""
import requests
import json


API = "https://jsonplaceholder.typicode.com"
"""REST API """


if __name__ == "__main__":
    users_res = requests.get('{}/users'.format(API)).json()
    todos_res = requests.get('{}/todos'.format(API)).json()
    users_data = {}
    for user in users_res:
        id = user.get('id')
        user_name = user.get('username')
        todos = list(filter(lambda x: x.get('userId') == id, todos_res))
        user_data = list(map(
            lambda x: {
                'username': user_name,
                'task': x.get('title'),
                'completed': x.get('completed')
            },
            todos
        ))
        users_data['{}'.format(id)] = user_data
    with open('todo_all_employees.json', 'w') as file:
        json.dump(users_data, file)
