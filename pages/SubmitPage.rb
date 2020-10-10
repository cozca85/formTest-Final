require 'watir'
require 'rspec'
require 'webdrivers'
require 'webdriver-user-agent'
require_relative 'BasePage'
require_relative 'ThankYouPage'

class SubmitPage < BasePage
  def initialize

  end
  #security question page --> verify you are on security page, enters answer to question and clicks next
  def selectNameOfFirstPet
    securityLabel = @@browser.label(id: 'label_10')
    if securityLabel.exists? == false
      fail "The page is not loaded"
    end
    @@browser.select_list(id: 'input_10_field_1').select "Name of the first pet"
    @@browser.text_field(id: 'input_10_field_2').send_keys('WELO')
  end

  def clickSubmitButton
    submitButton = @@browser.button(class: 'jfInput-button forSubmit form-submit-button u-right')
    # submits the form and verifies that the form has been submitted
    submitButton.click
  end

  def clickSubmitButtonMobile
    submitButton = @@browser.button(class: 'jfInput-button forSubmit forMobileNav form-submit-button u-center jsMobileSubmit')
    submitButton.wait_until_present
    submitButton.click
  end
end