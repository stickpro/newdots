#!/usr/bin/python3

import requests
import random

CURRENCY = 'USD'
SYMBOL = '$'
RANDOM = True

CRYPCOMPARE_API_URL = 'https://min-api.cryptocompare.com/data/price?fsym=%s&tsyms=%s'
CRYPCOMPARE_CURRENCIES = ('BTC', 'ETH', 'LTC', 'TRX')
#CRYPCOMPARE_CURRENCIES = ('MANA', 'ETH')

if RANDOM:
    CRYPCOMPARE_CURRENCIES = [ random.choice(CRYPCOMPARE_CURRENCIES) ]

values = {}

for currency in CRYPCOMPARE_CURRENCIES:
    response = requests.get(
        CRYPCOMPARE_API_URL % (currency, CURRENCY,))
    json_value = response.json()
    value = float(list(json_value.values())[0])
    values[currency.lower()] = value

fmt = ' . '.join([
    '%s: %.2f%s' % (currency, values[currency.lower()], SYMBOL)
    for currency in CRYPCOMPARE_CURRENCIES
])

print(fmt)
