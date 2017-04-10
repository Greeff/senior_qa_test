Feature: End the API session
  In order to finish
  As a user
  I would like to end the session


  Scenario: Successfully end the API session
    Given a current working session for login id "<user_name>" and api key "<api_key>"
    When I request to end the session
    Then session should expire with success message
