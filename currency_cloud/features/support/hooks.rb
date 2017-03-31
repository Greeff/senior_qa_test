require 'json'
require 'httparty'

Before do 
  # When I perform registration with the required parameters
  # Populate request information
  @request_url = 'https://devapi.currencycloud.com/v2/authenticate/api'
  @request_body = {
    'login_id' => 'ceehughes@gmail.com',
    'api_key' => '5676e2d4c83f64ff1e9aa69cc66d4e40be86df0da8920fba90ce26e52061f084'
  }
  puts @request_body
  @successful_response_code = 200
  @response = HTTParty.post(@request_url, :body => @request_body)
  @parsed_response = JSON.parse(@response.body,:symbolize_names => true)
  @auth_token = @parsed_response[:auth_token]
  puts @auth_token
end

After do
  @header =  {'X-AUTH-TOKEN' => "#{@auth_token}"}
  @close_session = HTTParty.post('https://devapi.currencycloud.com/v2/authenticate/close_session', :headers => @header)
  puts @close_session
end