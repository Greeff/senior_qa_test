When(/^a user is authenticated with valid supplied credentials$/) do
  expect(@response).to include('auth_token')
end

When(/^detailed rates are requested$/) do
  @quote_url = 'https://devapi.currencycloud.com/v2/rates/detailed'
  @buy_currency = 'USD'
  @sell_currency = 'GBP'
  @fixed_side = 'sell'
  @amount = '10000'
  @quote_body = {
    'buy_currency' => "#{@buy_currency}",
    'sell_currency' => "#{@sell_currency}",
    'fixed_side' => "#{@fixed_side}",
    'amount' => "#{@amount}"   
  }
  @header =  {'X-AUTH-TOKEN' => "#{@auth_token}"}
  @quote_response = HTTParty.get(@quote_url, :headers => @header, :body => @quote_body)
  @parsed_quote_response = JSON.parse(@quote_response.body,:symbolize_names => true)
  puts @parsed_quote_response
end

When(/^the service is available$/) do
  expect(@quote_response).not_to include('service_unavailable')
end

When(/^the parameters always include unique values for buy and sell currency$/) do
  expect(@buy_currency).not_to equal(@sell_currency)
end

When(/^the parameters always include a tradable currency pair$/) do
  expect(@quote_response).not_to include('ccy_pair_is_not_tradeable')
end

When(/^the parameters always include a fixed side on the side of which there is a known value$/) do
  expect(@quote_body).to include('fixed_side')
end

When(/^the parameters always include the sell currency$/) do
  expect(@quote_body).to include('sell_currency')
end

When(/^the sell currency is in valid format$/) do
  expect(@quote_response).not_to include('sell_currency_is_in_invalid_format')
end

When(/^the parameters always include the buy currency$/) do
  expect(@quote_body).to include('buy_currency')
end

When(/^the buy currency is in valid format$/) do
  expect(@quote_response).not_to include('buy_currency_is_in_invalid_format')
end

When(/^the parameters always include the amount$/) do
  expect(@quote_body).to include('amount')
end

When(/^the amount is of numeric type$/) do
  expect(@quote_response).not_to include('amount_type_is_wrong')
end

When(/^the amount is more than (\d+)$/) do |arg1|
  expect(@quote_response).not_to include('amount_is_too_small')
end

Then(/^I should receive a valid quote$/) do
  expect(@quote_response).to include('settlement_cut_off_time')
  @expected_buy_amount = (@parsed_quote_response[:client_sell_amount].to_f * @parsed_quote_response[:client_rate].to_f)
  expect(@parsed_quote_response[:client_buy_amount].to_f).to equal(@expected_buy_amount)
end


