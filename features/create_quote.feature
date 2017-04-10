Feature: Provide quote
  In order to book a deal
  As a client
  I want to be able to see my quote


  Scenario: Create a quote for selling GBP and Buying USD
    Given a quote provider
    When I am selling "XXXX" "GBP" and buying "USD"
    Then I should get the quote


  Scenario: Verify the buy amount is correct to the rate
    Given a quote provider
    When I am selling "XXXX" "GBP" and buying "USD"
    Then I should get the quote with rate
    And the buy amount should match the rate


  Scenario: Negative assertion
    Given a quote provider
    When I am selling "xyz123" "GBP" and buying "USD"
    Then I should receive an error
    And I should not get the quote
    And I should receive the failure message