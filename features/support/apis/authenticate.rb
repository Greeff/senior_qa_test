class Authenticate < Generic
  attr_reader :auth_token

  def login
    @auth_token = eval(post(
      path: 'authenticate/api',
      body: {
        login_id: CREDS[:id],
        api_key: CREDS[:key]
      }
    ).body)[:auth_token]
  end

  def end_session
    post(
      path: 'authenticate/close_session',
      headers: {
        'X-Auth-Token': @auth_token
      }
    )
  end

  def verify_auth_token
    raise 'Auth token non-existent.' if @auth_token.empty?
  end
end
