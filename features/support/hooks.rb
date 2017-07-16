at_exit do
  API.authenticate.end_session
end