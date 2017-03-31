Feature: Quote generation
  Scenario: Successful quote generation

    When a user is authenticated with valid supplied credentials

    And detailed rates are requested

    And the service is available

    And the parameters always include unique values for buy and sell currency

    And the parameters always include a fixed side on the side of which there is a known value

    And the parameters always include the sell currency
      And the sell currency is in valid format

    And the parameters always include the buy currency
      And the buy currency is in valid format

    And the parameters always include the amount 
      And the amount is of numeric type
      And the amount is more than 1

    Then the request should be successful

    And I should receive a valid quote