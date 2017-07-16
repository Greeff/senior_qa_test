@quotes
Feature: Quotes

  @create_quote
  Scenario: Creating a Quote
    Given I create a quote using the following information:
      | sell_currency | buy_currency | fixed_side |
      | GBP           | USD          | sell       |
    Then the buy amount should be correct to the rate

  Scenario: Creating a Quote with an amount that's less than the minimum required
    Given I create a Quote using an amount that's less than the minimum required
      | sell_currency | buy_currency | fixed_side | amount |
      | GBP           | USD          | sell       | 0.99   |
    Then the quotation should be unsuccessful
