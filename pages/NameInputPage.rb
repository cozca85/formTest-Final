require 'watir'
require 'rspec'
require 'webdrivers'
require 'faker'
require 'webdriver-user-agent'
require_relative 'BasePage'
require_relative 'FileUploadPage'

class NameInputPage < BasePage
  def initialize

  end

  #Name Page -> Creates dummy first name and second name and clicks next
  # call the methods back to back from the test for scenario

  def fillinName
    firstNameInput = @@browser.text_field(id: 'first_3')
    firstNameInput.send_keys(Faker::Name.name)
  end

  def fillinLastName
    surNameInput = @@browser.text_field(id: 'last_3')
    surNameInput.send_keys(Faker::Name.name)
  end

  def clickNext
    nextButton1 = @@browser.button(class: 'jfInput-button forNext')
    nextButton1.click
  end

  def clickNextMobile
    nextButton1 = @@browser.button(xpath: '//*[@id="cardProgress"]/div[3]/button[2]')
    nextButton1.click
  end

end
