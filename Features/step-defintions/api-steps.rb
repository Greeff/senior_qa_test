Given (/^User is logged in$/) do
  @http_connection = Rest_service.get_connection
  # logic needed for the token authenication here
end

When (/^I send a (POST) request to "(.*?)" for a new quote$/) do |method, end_point, json_text|
  http_request = Rest_service.get_request(method, end_point)
  http_request['content-type'] = 'application/json'
  http_request['accept'] = 'application/json'
  http_request.body = json_text
  @http_response = Rest_service.execute_request(@http_connection, http_request)
  @last_json = @http_response.body
end

Then(/^the HTTP status code should be (\d+)$/) do |http_code|
  expect(@http_response.code).to eql(http_code)
end

Then (/^the JSON response will be:$/) do |json_text|
  expect(@last_json).to be_json_eql json_text
end

Then (/^the JSON response will NOT have:$/) do |json_text|
  expect(@last_json).should_not be_json_eql json_text
end
