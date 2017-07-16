require_relative "../spec_helper"

include SeniorQaTestApi::Services

RSpec.describe "Currency Cloud Senior QA Test Acceptance testing" do


	it "Can Perform User Login and retrieve a login token" do
		response = userLogin.userLogin(login_id: 'olujoe7@gmail.com', api_key: "2addba153748227ee7aaf681fc71e149ff217cb66300dca80361a3b43e0c2c8b")
		expect(response.code).to eql 200
		$x_auth_token = response.body.to_s.split("\"")[1]    
	end

	it "Can Create a quote for Selling GBP and buying USD using the sell side" do
	    response = createQuote.createQuote(buy_currency: 'GBP', sell_currency: 'USD', fixed_side: 'sell', amount: '10000.23', term_agreement: 'true')
	    expect(response.code).to eql 200
	    $id = response.body.to_s.split("\"")[0] 		
	end

	it "Can Fail to Verify the buy amount is correct to the rate " do
	    response = verifyBuyAmount.verifyBuyAmount(id: 0)
    	expect(response.code).to eql 400
	end

	it "Can Verify the buy amount is correct to the rate " do
	    response = verifyBuyAmount.verifyBuyAmount(id: $id)
    	expect(response.code).to eql 200
   	end

	it "Can Fail to Create another quote but perform a negative assertion" do
	    response = createQuote.createQuote(buy_currency: 0, sell_currency: 'USD', fixed_side: 'sell', amount: '10000.23', term_agreement: 'true')
	    expect(response.code).to eql 400
	    $id = response.body.to_s.split("\"")[0]
	end

	it "Can Create another quote but perform a negative assertion" do
	    response = createQuote.createQuote(buy_currency: 'GBP', sell_currency: 'USD', fixed_side: 'sell', amount: '10000.23', term_agreement: 'true')
	    expect(response.code).to eql 400
	end
	
	it "Can End the API Session" do
	    response = userSession.userSession()
	    expect(response.code).to eql 200
	end		

	it "Can Fail to Perform User Login and retrieve a login token" do
		response = userLogin.userLogin(login_id: 'olujo@gmail.com', api_key: "2addba153748227ee7aaf681fc71e149ff217cb66300dca80361a3b43e0c2c8b")
		expect(response.code).to eql 401
	end
	 
	
end
