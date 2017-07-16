class Rate < Generic

  # accepts a Hash
  # amount is randomly generated if not specified
  def create_quote(quote_input)
    @quote_result = get(
      path: 'rates/detailed',
      headers: {'X-Auth-Token': API.authenticate.auth_token},
      body: {
        sell_currency: quote_input['sell_currency'],
        buy_currency:  quote_input['buy_currency'],
        fixed_side:    quote_input['fixed_side'],
        amount:        (quote_input['amount'] || rand(1.0...10.0).round(2).to_s)
      }
    )

    @sell_currency = quote_input[:sell_currency]
    @buy_currency  = quote_input[:buy_currency]
  end

  # if no currency pair is specified, retrieve the rate for
  # the most recently used currency pair
  def retrieve_rates(currency1=nil, currency2=nil)
    get(
      path: 'rates/find',
      headers: {'X-Auth-Token': API.authenticate.auth_token},
      body: {
        currency_pair: (currency1 || @sell_currency)  + (currency2 || @buy_currency)
      }
    )
  end

  def verify_quote_unsuccessful
    debug {
      raise('Quote was unexpectedly successful.') if @quote_result.success?
    }
  end
end
