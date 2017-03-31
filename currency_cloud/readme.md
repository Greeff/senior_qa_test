Background:

A new Payments API has been delivered. 

This API allows users to:
- create new payment records;           
- amend details after submission;       
- search for existing payments; and     
- delete payment records as required.

The API returns JSON responses and performs error handling in the event of an invalid request taking place.

In the currency_cloud folder in the command line:
Setup: 'bundle'
Run cucumber to view tests: 'cucumber'

Requirements:

- performs User Login and retrieve a login token

Added to hooks.rb Before block

POST /v2/authenticate/api

Generates an authentication token for the API user which needs to be used in all subsequent calls.

Required parameters
Key       | Type   | Value
login_id  | string | ceehughes@gmail.com
api_key   | string | 5676e2d4c83f64ff1e9aa69cc66d4e40be86df0da8920fba90ce26e52061f084

Example response:

{
  "auth_token": "9a15efcbc4911bb344762b36c34c86b4"
}

- creates a quote for selling GBP and buying USD using the sell side

GET /v2/rates/detailed

Returns a hash containing a full quote for the requested currency based on the spread table of the currently logged in contact. If delivery date is not supplied it will default to a deal which settles in 2 working days.

| Key           | Type    | Value
| buy_currency  | string  | USD
| sell_currency | string  | GBP
| fixed_side    | string  | sell
| amount        | string  | 10000

Example response:

{
  "settlement_cut_off_time": "2017-04-03T15:30:00Z",
  "currency_pair": "GBPUSD",
  "client_buy_currency": "USD",
  "client_sell_currency": "GBP",
  "client_buy_amount": "12478.00",
  "client_sell_amount": "10000.00",
  "fixed_side": "sell",
  "mid_market_rate": "1.2481",
  "client_rate": "1.2478",
  "partner_rate": null,
  "core_rate": "1.2478",
  "deposit_required": false,
  "deposit_amount": "0.0",
  "deposit_currency": "GBP"
}

- verifies the buy amount is correct to the rate

Added a check to the quote feature

- creates another quote but perform a negative assertion

Added negative assertions based on not receiving error message codes to quote.rb

- ends the API Session

Included in hooks.rb After block

post /v2/authenticate/close_session

A successful response will return a 200 code with a blank body.

We will be looking for how you implement the API calls within your code, using OOP. We will also be considering your usuage of best practices, config files and storing information for further steps.