When(/^I perform registration with the required parameters$/) do
  expect(@response).to include('auth_token')
end

When(/^the parameters include the login id$/) do
  expect(@request_body).to include('login_id')
end

When(/^the login id is for a valid username$/) do
  expect(@response).not_to include('invalid_supplied_credentials')
end

When(/^the login id is not too short$/) do
  expect(@response).not_to include('login_id_is_too_short')
end

When(/^the login id is not too long$/) do
  expect(@response).not_to include('login_id_is_too_long')
end

When(/^the parameters include the api key$/) do
  expect(@request_body).to include('api_key')
end

When(/^the api key is the correct length$/) do
  expect(@response).not_to include('api_key_length_is_invalid')
end

When(/^too many requests have not already been made to the api$/) do
  expect(@response).not_to include('too_many_requests')
end

Then(/^the request should be successful$/) do
  expect(@response.code).to equal(@successful_response_code)
end

Then(/^I should receive a valid auth token$/) do
  expect(@response).to include('auth_token')
  puts @response
end