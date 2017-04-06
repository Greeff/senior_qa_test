Scenario:  Successful registration
   When I perform registration with the required parameters
   Then the request should be successful
   And I should receive a valid access token

    Step definitions
    
    
    When /^I perform registration with the required parameters$/ do
  # Populate request information
  @request_method = "POST"
  @request_url = "/rest/register"
  @request_body = {email: generateEmail, password: "pass123",
      terms_accepted: true}
  @successful_response_code = 201
  @error_response_code_email_reserved = 409
end
 
Then /^the request should be successful$/ do
  # Perform the request and assert the response code
  @response = RestApi.call(@request_method, @request_url,
      body: @request_body, expect: @successful_response_code)
end
