class Generic

  def base_url
    'https://devapi.currencycloud.com/v2/'
  end

  # at the moment, it captures get and post requests but it is extensible
  def method_missing(method_name, contents)
    raise("Request invalid: #{method_name}") unless requests_list.include? method_name

    response = HTTParty.send(method_name, 
      base_url + contents[:path],
      headers: contents[:headers] || {},
      body: contents[:body] || {}
    )

    debug(:api_call) { response }
  end

  # if option is nil, this method will not process api responses -- only verification points
  #
  # otherwise, if STRICT mode is enabled, an exception will automatically be thrown for failed API calls
  # if STRICT mode is not enabled, the result of API call (either successful or not) will
  # be returned for further processing e.g. to be used in verification methods
  def debug(option=nil, &block)
    begin
      if !option.nil?
        raise(yield.to_s) unless yield.success? if !ENV['STRICT'].nil?
      end
      yield
    rescue => e
      # if DEBUG mode is enabled, test execution will pause instead of an exception throw
      # this will enable a developer to investigate in real time what went wrong
      ENV['DEBUG'].nil? ? raise(e.message) : binding.pry
    end
  end

  private

    # extensible -- can include patch etc. in the future
    def requests_list
      [:post, :get]
    end
end
