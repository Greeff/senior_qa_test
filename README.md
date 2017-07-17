# senior_qa_test
Technical test for Senior QA Analyst

# Currencycloud-Tech-Test

## Scenario:

A new Payments API has been delivered. This API allows users to create new payment records, amend details after submission, search for existing payments, and delete payment records as required. The API returns JSON responses and performs error handling in the event of an invalid request taking place.

## Acceptance Criteria:

You are required to develop the user journies in Cucumber, using a language of your choice (Ruby is preferable to us), which will:
- Perform User Login and retrieve a login token
- Create a quote for Selling GBP and buying USD using the sell side
- Verify the buy amount is correct to the rate 
- Create another quote but perform a negative assertion 
- End the API Session


## Deliverable:

Before starting the test create a new branch on this repository with an initial commit. Make your changes, commit them to your branch and then create a PR for review. Your PR MUST include a README.MD file that will have clear instructions on how to set up your framework along with how to run the tests. Please include the reasoning behind your tech choices. 

## Helpful Links:

**CurrencyCloud API Documentation:** https://developer.currencycloud.com/documentation/api-docs/overview/


## Instructions

<<<<<<< HEAD
create a new branch on this repository with an initial commit

create a PR for review
=======
create a new folder on your local machine

create a PR
>>>>>>> 5a1c98afae5dcbf542fce705b06504ae46a50d51

in your local directory execute:

    $ bundle

Then execute:

<<<<<<< HEAD
	$ rspec
=======
    $ rspec
>>>>>>> 5a1c98afae5dcbf542fce705b06504ae46a50d51

## Reasoning
I initiall started to creat a cucumber framework tusing Given, When and Then Scenario Outlines and corresponding step_definitions including relevant modules, classes and methods. When it occured to me that I am testing an API and I wouldnt normally use this type of test framework for an API test, whic sits perfectly for a GUI test instead.

I decided to employ an rspec framwork instead and created an senior_qa_test_api gem (see https://github.com/olujoe/senior_qa_test_api.git)to help with the task.

## NOTE

Unfortunately at the time of posting this test into github, the API is broken and will not allow the creation of a quote whicch is a key acceptance criteria and likewise verificationof quote creation also fails.
