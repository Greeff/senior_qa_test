@cc_test
Feature: currencycloud_acceptance.feature

Background:
	Given Perform User Login with <login_id>, <api_key> and retrieve a login token

@cc_test1
Scenario Outline: Successful user journey
	When Create a quote for <selling_currency> and <buying_currency> using the <fixed_side>
	Then Verify the buy amount is correct to the rate 
	When Create a quote for <selling_currency> and <buying_currency> using the <fixed_side> #Create another quote but perform a negative assertion 
	Then End the API Session	

Examples:
	|selling_currency|buying_currency|fixed_side|amount|term_agreement|login_id         |api_key                                                          |
	|   GBP          |  USD          | sell     |100.23| true         |olujoe7@gmail.com|2addba153748227ee7aaf681fc71e149ff217cb66300dca80361a3b43e0c2c8b |
	|   GBP          |  USD          | sell     |100.23| true         |olujoe@gmail.com |2addba153748227ee7aaf681fc71e149ff217cb66300dca80361a3b43e0c2c8b |
	|   GBP          |  USD          | sell     |100.23| true         |olujoe7@gmail.com|2addba153748227ee7aaf681fc71e149ff217cb66300dca80361a3b43e0c2c8c |
