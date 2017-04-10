Feature: User Login
  In order to test API User Login
  As a QA person
  I want to be able to perform user login and retrieve a login token


    Scenario: Successful login request
        Given a valid user with login id "<user_name>" and api key "<api_key>"
        When I request for authentication
        Then I should receive an authentication token

    Scenario: Failed login request
        Given an invalid user with login id "<user_name>" and api key "<api_key>"
        When I request for authentication
        Then I should receive an authentication error
        And I should not receive an authentication token