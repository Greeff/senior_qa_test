require 'net/http'
require 'uri'

module Rest_service
  HTTP_TIMEOUT_FOR_RESPONSE = 180
  
  #
  # Sets up a connection 
  #
  def Rest_service.get_connection
      http_connection = nil
      http_connection = Net::HTTP.new($app_host)      
      http_connection.read_timeout = HTTP_TIMEOUT_FOR_RESPONSE
      return http_connection
  end

  #
  # Gets a request based on the method and the url sent as parameters
  # method: POST, PUT, DELETE or GET
  # url : e.g. '/users', '/projects'
  #
  def Rest_service.get_request(method, url)
    request = nil   
    url =  $app_root + url
#    uri = URI.parse("https://currencycloud.com")
#    pem = File.read("/path/to/my.pem")
#    http = Net::HTTP.new(uri.host, uri.port)
#    http.use_ssl = true
#    http.cert = OpenSSL::X509::Certificate.new(pem)
#    http.key = OpenSSL::PKey::RSA.new(pem)
#    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
# request = Net::HTTP::Get.new(uri.request_uri)
    case method
      when "POST"
        request = Net::HTTP::Post.new(url)
      when "PUT"
        request = Net::HTTP::Put.new(url)
      when "DELETE"
        request = Net::HTTP::Delete.new(url)
      when "GET"
        request = Net::HTTP::Get.new(url)
    end

    request.basic_auth($app_user, $app_pass)  
    return request
  end



  #
  # Executes the request
  # Return http response
  #
  def Rest_service.execute_request(http_connection, http_request)
    http_response = http_connection.request(http_request)
    return http_response
  end
end