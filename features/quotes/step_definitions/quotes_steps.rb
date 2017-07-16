Given /^I create a quote using the following information:$/ do |quote_input|
  pending
  API.rate.create_quote(quote_input.hashes.first)
end

Then /^the buy amount should be correct to the rate$/ do

end

Given /^I create a Quote using an amount that's less than the minimum required$/ do |quote_input|
  API.rate.create_quote(quote_input.hashes.first)
end
  
Then /^the quotation should be unsuccessful$/ do
  API.rate.verify_quote_unsuccessful
end