import selenium
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import unittest



class CloudCurrency(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Firefox()

#    def tearDown(self):
#        self.driver.quit()

    def test_login_valid_credentials(self):
        #Login with valid credentials

        driver = self.driver
        driver.get("https://direct-demo.currencycloud.com/")

        # Given a valid username is entered
        self.driver.find_element(by=By.ID, value="login_id_form_username").send_keys("lisasau85@gmail.com")

        # And Go button is clicked
        self.driver.find_element(by=By.ID, value="go-btn").click()

        # And Valid Password is entered
        self.driver.find_element(by=By.ID, value="login_form_password").send_keys("Today14072017!")

        # Then browser should take me to the Dashboard with I click on Submit button
        self.driver.find_element(by=By.ID, value="go-btn").click()


    def test_complete_conversion(self):
        # Sell & Buy Currency

        driver = self.driver
        driver.get("https://direct-demo.currencycloud.com/")

        # Given I click on Convert & Pay on the sidebar UNABLE TO FIND LOCATOR
        self.driver.find_element(by=By.ID, value='main-dashboard').click("sp-dashboard-convert_currency")

        # And I am on Convert & Pay Dashboard UNABLE TO FIND LOCATOR
        self.driver.find_element(by=By.ID, value="new_conversions_conversion_form").click()

        # And I select GBP for sell DEPENDENCY
        self.driver.find_element(by=By.ID, value="conversions_conversion_form_sell_currency").send_keys("GBP")

        # And I select USD for Buy DEPENDENCY
        self.driver.find_element(by=By.ID, value="conversions_conversion_form_buy_currency").send_keys("EURO")

        # And Sell is selected on dropdown of Amount DEPENDENCY
        self.driver.find_element(by=By.ID, value="conversions_conversion_form_fixed_side").send_keys("sell")

        # And I enter value of Sell Amount DEPENDENCY
        self.driver.find_element(by=By.ID, value="conversions_conversion_form_amount").send_keys(value="40.00")

        # And I Click on Select a Date info DEPENDENCY
        self.driver.find_element(by=By.ID, value="btn btn-primary btn-embossed btn-block btn-inline").click()

        # And I select a Date DEPENDENCY
        self.driver.find_element(by=By.ID, value="conversions_conversion_form_conversion_date").send_keys("18 Jul 2017")

        # And I Submit conversion value DEPENDENCY
        self.driver.find_element(by=By.CLASS_NAME, value="btn btn-primary btn-embossed btn-block btn-inline").click()

        # Then I should receive a quote UNABLE TO RECEIVE QUOTE MANUALLY
        self.assertIn(by=By.TEXT, value="Conversion Rate Could Not Be Retrieved")

if __name__ == '__main__':
    unittest.main()
