Feature: Login with lisasau85@gmail.com

  Scenario: Entering Valid Username

    Given I am a returning customer
    When I enter "lisasau85@gmail.com"
    Then I should be asked to enter Token ID


Feature: Login using Token ID

  Scenario: Entering Valid Token ID

    Given That I have entered valid Username
    When I enter the following Token ID: Today14072017!
    Then I should be taken to Cloud Currency Dashboard
