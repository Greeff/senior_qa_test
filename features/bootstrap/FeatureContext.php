<?php

use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

/**
 * Defines application features from the specific context.
 */
class FeatureContext implements Context
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }


    /**
     * @Given a valid user with login id :arg1 and api key :arg2
     */
    public function aValidUserWithLoginIdAndApiKey($arg1, $arg2)
    {
        throw new PendingException();
    }

    /**
     * @When I request for authentication
     */
    public function iRequestForAuthentication()
    {
        // developer to implement the code
        throw new PendingException();
    }

    /**
     * @Then I should receive an authentication token
     */
    public function iShouldReceiveAnAuthenticationToken()
    {
        throw new PendingException();
    }

    /**
     * @Given an invalid user with login id :arg1 and api key :arg2
     */
    public function anInvalidUserWithLoginIdAndApiKey($arg1, $arg2)
    {
        throw new PendingException();
    }

    /**
     * @Then I should receive an authentication error
     */
    public function iShouldReceiveAnAuthenticationError()
    {
        throw new PendingException();
    }

    /**
     * @Then I should not receive an authentication token
     */
    public function iShouldNotReceiveAnAuthenticationToken()
    {
        throw new PendingException();
    }

    /**
     * @Given a quote provider
     */
    public function aQuoteProvider()
    {
        throw new PendingException();
    }

    /**
     * @When I am selling :arg1 :arg2 and buying :arg3
     */
    public function iAmSellingAndBuying($arg1, $arg2, $arg3)
    {
        throw new PendingException();
    }

    /**
     * @Then I should get the quote
     */
    public function iShouldGetTheQuote()
    {
        throw new PendingException();
    }

    /**
     * @Then I should get the quote with rate
     */
    public function iShouldGetTheQuoteWithRate()
    {
        throw new PendingException();
    }

    /**
     * @Then the buy amount should match the rate
     */
    public function theBuyAmountShouldMatchTheRate()
    {
        throw new PendingException();
    }

    /**
     * @Then I should receive an error
     */
    public function iShouldReceiveAnError()
    {
        throw new PendingException();
    }

    /**
     * @Then I should not get the quote
     */
    public function iShouldNotGetTheQuote()
    {
        throw new PendingException();
    }

    /**
     * @Then I should receive the failure message
     */
    public function iShouldReceiveTheFailureMessage()
    {
        throw new PendingException();
    }

    /**
     * @Given a current working session for login id :arg1 and api key :arg2
     */
    public function aCurrentWorkingSessionForLoginIdAndApiKey($arg1, $arg2)
    {
        throw new PendingException();
    }

    /**
     * @When I request to end the session
     */
    public function iRequestToEndTheSession()
    {
        throw new PendingException();
    }

    /**
     * @Then session should expire with success message
     */
    public function sessionShouldExpireWithSuccessMessage()
    {
        throw new PendingException();
    }
}
