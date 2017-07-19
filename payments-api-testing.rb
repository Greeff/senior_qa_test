require "httparty"

class TestAPI
  include HTTParty
  base_uri 'http://localhost:9000/api'
end