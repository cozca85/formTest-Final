require 'watir'
require 'rspec'
require 'webdrivers'
require 'webdriver-user-agent'
require_relative 'BasePage'

class ThankYouPage < BasePage
  def initialize

  end

  def verifyFormSubmitted
    @@browser.div(class: 'jfThankYou-description form-subHeader').exists? == true
  end
end