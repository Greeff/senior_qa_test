Feature: Login

  @smoke
  Scenario: Retrieving a login token
    Given I have submitted valid login credentials
    Then I should be able to retrieve a login token
  