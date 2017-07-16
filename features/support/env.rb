require 'pry'
require 'singleton'
require 'httparty'

require Dir.pwd + '/features/support/apis/generic.rb'

begin
  CREDS = {id: ENV['ID'], key: ENV['KEY']}
ensure
  raise('Login ID not specified.') if CREDS[:id].nil?
  raise('API Key not specified.') if CREDS[:key].nil?
end
