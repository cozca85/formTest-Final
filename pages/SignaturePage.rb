require 'watir'
require 'rspec'
require 'webdrivers'
require 'webdriver-user-agent'
require_relative 'BasePage'
require_relative 'DatePage'

class SignaturePage < BasePage
  def initialize

  end
  #signature page ( skips manual signature drawing step )

  def verifySignatureField
    signatureLabel = @@browser.label(id: 'label_7')
    signatureLabel.exists?
  end

  def clickNext
    nextButton3 = @@browser.button(xpath: '/html/body/div[5]/form/ul/li[3]/div/div/div[3]/button[2]')
    nextButton3.exists?
    nextButton3.click
  end

  def clickNextMobile
    nextButton3 = @@browser.button(xpath: '//*[@id="cardProgress"]/div[3]/button[2]')
    nextButton3.exists?
    nextButton3.click
  end
end