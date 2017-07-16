Given /^I have submitted valid login credentials$/ do
  API.authenticate.login
end
    
Then /^I should be able to retrieve a login token$/ do
  API.authenticate.verify_auth_token
end
