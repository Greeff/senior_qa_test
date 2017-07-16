class Generic

  def base_url
    'https://devapi.currencycloud.com/v2/'
  end

  def post(contents)
    result = HTTParty.post(
      base_url + contents[:path],
      headers: contents[:headers] || {},
      body: contents[:body] || {}
    )
    debug {
      result
    }
  end

  def get
    result = HTTParty.get(
      base_url + contents[:path],
      headers: contents[:headers] || {},
      body: contents[:body] || {}
    )
    debug {
      result
    }
  end

  private
  
    def debug(&block)
      begin
        raise(yield.to_s) unless yield.success?
        yield
      rescue => e
        ENV['DEBUG'].nil? ? raise(e.message) : binding.pry
      end
    end
end
