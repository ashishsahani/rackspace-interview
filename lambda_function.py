import json
import requests

def lambda_handler(event, context):

  url = "https://dummyjson.com/users"
  response = requests.get(url)
  if response.status_code != 200:
    raise Exception("Failed to get eye colors: {}".format(response.status_code))

  data = json.loads(response.content)
  eye_colors = {}
  users = data['users']
  for user in users:
    eye_color = user['eyeColor']
    if eye_color not in eye_colors:
      eye_colors[eye_color] = 0
    eye_colors[eye_color] += 1

  return eye_colors