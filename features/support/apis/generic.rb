# post and get requests are all wraped in a debug method

class Generic

  def base_url
    'https://devapi.currencycloud.com/v2/'
  end

  def post(contents)
    response = HTTParty.post(
      base_url + contents[:path],
      headers: contents[:headers] || {},
      body: contents[:body] || {}
    )
    debug { response }
  end

  def get(contents)
    response = HTTParty.get(
      base_url + contents[:path],
      headers: contents[:headers] || {},
      body: contents[:body] || {}
    )
    debug { response }
  end

  private
  
    # if STRICT mode is enabled, an exception will automatically be thrown
    # for failed API calls
    # if not, the result of API call (either successful or otherwise) will
    # be returned for further processing e.g. to be used in verification methods
    def debug(&block)
      begin
        raise(yield.to_s) unless yield.success? if !ENV['STRICT'].nil?
        yield
      rescue => e
        # if DEBUG mode is enabled, test execution will pause instead of an exception throw
        # this will enable a developer to investigate in real time what went wrong
        ENV['DEBUG'].nil? ? raise(e.message) : binding.pry
      end
    end
end
