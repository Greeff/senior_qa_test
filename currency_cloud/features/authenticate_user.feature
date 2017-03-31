Feature: Authenticate User
  In order to log my user in
  I need to post required parameters to get a valid auth token

  Scenario:  User is successfully logged in
    When I perform registration with the required parameters

    And the parameters include the login id

    And the login id is for a valid username

    And the login id is not too short

    And the login id is not too long

    And the parameters include the api key

    And the api key is the correct length

    And too many requests have not already been made to the api

    Then the request should be successful

    And I should receive a valid auth token