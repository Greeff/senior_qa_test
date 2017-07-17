Feature: Using Firefox and navigate to CurrencyCloud site: https://direct-demo.currencycloud.com/

  Scenario: Returning to Currency Cloud as an existing user

    Given That I open Firefox browser
    When I enter the following link: https://direct-demo.currencycloud.com/
    Then It should take me into the login page


Feature: Navigate to Conversion & Pay

  Scenario: Making a conversion

    Given That I am on Cloud Currency Dashboard
    When I Click on Convert & Pay on the side bar
    And I select GBP for Sell
    And I select USD for Buy
    And I enter an Buy Amount
    When I select a Date
    And I receive quote
    Then Conversion should be complete
