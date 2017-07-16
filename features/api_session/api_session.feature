@api_session
Feature: API Session

  @smoke
  Scenario: Retrieving an Authentication Token
    Given I have submitted valid login credentials
    Then I should be able to retrieve a login token
