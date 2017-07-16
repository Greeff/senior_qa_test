at_exit do
  # ensures that the session is ended
  # if the framework does not abnormally terminate 
  API.authenticate.end_session
end
