Given(/^Perform User Login with "(.*?)", "(.*?)" and retrieve a login token$/) do |login_id, api_key|
	login = UserLogin.new
	login.user(login_id, api_key)
end

When(/^Create a quote for "(*.?)" and "(.*?)" using the "(.*?)", "(.*?)" and "(.*?)"$/) do |selling_currency, buying_currency, fixed_side, amount, term_agreement|
	sell = Sell.new 
	sell.quote(buying_currency, selling_currency, fixed_side, amount, term_agreement)
end

Then(/^Verify the buy amount is correct to the rate$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^End the API Session$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


class UserLogin
	def login(login_id, api_key)

	end	
end	

class Sell
	def quote(selling_currency, buying_currency, fixed_side, amount, term_agreement)
	end
end
