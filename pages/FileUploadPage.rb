require 'watir'
require 'rspec'
require 'webdrivers'
require 'faker'
require_relative 'BasePage'
require_relative 'SignaturePage'

class FileUploadPage < BasePage
  def initialize

  end
  #file upload page -> Sets file path to a file and click next
  def fillFileUpload
    fileUploadField = @@browser.file_field(id: 'input_9')
    fileUploadField.exists?
    fileUploadField.set('C:\upload\Issues.pdf')
  end

  def clickNext
    nextButton3 = @@browser.button(xpath: '/html/body/div[5]/form/ul/li[2]/div/div/div[3]/button[2]')
    nextButton3.click
  end

  def clickNextMobile
    nextButton3 = @@browser.button(xpath: '//*[@id="cardProgress"]/div[3]/button[2]')
    nextButton3.click
  end

end
