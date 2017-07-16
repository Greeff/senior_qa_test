require 'pry'
require 'singleton'
require 'httparty'

require Dir.pwd + '/features/support/apis/generic.rb'

# login credentials should be passed in through the terminal
# for security purposes
begin
  CREDS = {id: ENV['ID'], key: ENV['KEY']}
ensure
  # throw an exception if credentials are insufficient
  raise('Login ID not specified.') if CREDS[:id].nil?
  raise('API Key not specified.') if CREDS[:key].nil?
end
