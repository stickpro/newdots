#!/usr/bin/python3
import requests

url = 'https://api.exchangerate-api.com/v4/latest/USD'

response = requests.get(url)
data = response.json()

print('$:', data['rates']['RUB'], '₽')
			
