require 'sinatra'
require 'httparty'
require 'json'

class CurrencyCloud < Sinatra::Base
  include 'httparty'

  get '/quote' do 
  end
end