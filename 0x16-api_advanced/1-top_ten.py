#!/usr/bin/python3
"""Return the number of subscribers for given subreddit
"""
import requests


def top_ten(subreddit):
    """Print the title of the 10 hotest posts on a given subtreddit."""
    url = 'https://api.reddit.com'
    headers = {
        "User-Agent": "My Reddit API Client/1.0"
    }
    params = {
        "limit": 10
    }

    res = requests.get("{}/r/{}/hot".format(url, subreddit),
                       headers=headers, params=params)
    if res.status_code == 404:
        return print(None)
    children = res.json().get('data').get('children')
    print("\n".join([child.get('data').get('title') for child in children]))
