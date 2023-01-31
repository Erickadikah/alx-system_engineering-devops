#!/usr/bin/python3
"""Return the number of subscribers for given subreddit
"""

import requests

def number_of_subscribers(subreddit):
    url = "https://api.reddit.com"
    headers = {
        "User-Agent": "My Reddit API Client/1.0"
    }
    res = requests.get("{}/r/{}/about".format(url, subreddit), headers=headers)
    if res.status_code == 404:
        return 0
    return res.json().get('data').get('subscribers')
