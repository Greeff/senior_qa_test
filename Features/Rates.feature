Feature: Rates

Background: 
Given User is loggged In

Scenario: Verify quote for selling GBP and buying USD on the sell side
 When I send a POST request to "/v2/rates/detailed" for a new quote
  """
    {
         "buy_currency": "USD",
         "sell_currency": "GBP",
         "fixed_side": "sell"
         "amount": "1000"
    }
  """
 Then the HTTP status code should be 200
 And the JSON response should be:
  """
    {
		 "settlement_cut_off_time":"2013-01-24T14:00:00Z",
		 "currency_pair":"GBPUSD",
		 "client_buy_currency":"GBP",
		 "client_sell_currency":"USD",
		 "client_buy_amount":"1000.00",
		 "client_sell_amount":"1594.90",
		 "fixed_side":"buy",
		 "mid_market_rate":"1.5868",
		 "core_rate":"1.587",
	     "partner_rate":"1.5878",
		 "client_rate":"1.5949",
		 "deposit_required": "true",
		 "deposit_amount": "316.96",
		 "deposit_currency": "USD"
    }
  """