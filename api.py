import os

import requests

url = 'https://ballchasing.com/api'
token = os.getenv('BALL_CHASING_API_TOKEN')
auth_headers = { 'Authorization': token }

# response = requests.get(url + '/', headers=auth_headers)
# print(response.json())

payload = {
    'playlist': 'ranked-duels',
    'min-rank': 'grand-champion',
    'pro': 'true',
}

kwargs = { 'params': payload, 'headers': auth_headers }

response = requests.get(url + '/replays', params=payload, headers=auth_headers)
print(response)
# print(response.json())
print(response.json().keys())
print(response.json()['count'])
next_url = response.json()['next']
print(next_url)

print('-' * 20)

next_response = requests.get(next_url, headers=auth_headers)
print(next_response)
# print(next_response.json())
print(next_response.json()['count'])
print(next_response.json()['next'])
