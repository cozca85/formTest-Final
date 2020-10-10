require 'watir'
require 'rspec'
require 'webdrivers'
require_relative 'BasePage'
require_relative 'SubmitPage'
require 'webdriver-user-agent'

class DatePage < BasePage
  def initialize

  end
  #datepage -> inputs today's date and clicks next
  def fillDate
    dateInputField = @@browser.text_field(id: 'lite_mode_6')
    dateInputField.exists?
    sleep(10)
    date = DateTime.now.strftime('%m-%d-%Y')
    dateInputField.set!(date)
  end

  def fillDateMobile
    dateInputField = @@browser.input(id: 'input_6')
    date = DateTime.now.strftime('%m-%d-%Y')
    dateInputField.send_keys(date)
  end

  def clickNext
    nextButton5 = @@browser.button(xpath: '/html/body/div[5]/form/ul/li[4]/div/div/div[3]/button[2]')
    nextButton5.exists?
    nextButton5.click
  end

  def clickNextMobile
    nextButton5 = @@browser.button(xpath: '//*[@id="cardProgress"]/div[3]/button[2]')
    nextButton5.exists?
    nextButton5.click
  end

end