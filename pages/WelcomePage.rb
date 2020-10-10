require 'watir'
require 'rspec'
require 'webdrivers'
require 'webdriver-user-agent'
require_relative 'BasePage'
require_relative 'NameInputPage'

class WelcomePage < BasePage
  def initialize (browser, type)
    super(browser, type)
  end

  def navigatetoNamePage
    @@browser.goto('https://form.jotform.com/201882323530347')
    nextButton = @@browser.button(css: "#jfCard-welcome-start")
    nextButton.wait_until_present
    puts "Webpage open and test started..."
    nextButton.click
  end

end
