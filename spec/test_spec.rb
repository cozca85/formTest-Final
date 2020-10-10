require 'spec_helper'
require 'watir'
require 'webdrivers'
require 'faker'
require 'date'
require 'rspec'
require 'ffi'
require 'webdriver-user-agent'
require_relative '../pages/WelcomePage'
require_relative '../pages/NameInputPage.rb'
require_relative '../pages/BasePage'
require_relative '../pages/DatePage'
require_relative '../pages/FileUploadPage'
require_relative '../pages/ThankYouPage'
require_relative '../pages/SignaturePage'
require_relative '../pages/SubmitPage'


RSpec.describe FormTest do

  @@browser = nil
  @@webform = nil

  after(:each)do
    session = @@browser
    session.close
  end

  def submitValidValuesUntilSecurityQuestionPage
    @@webform.navigatetoNamePage
    nameInputPage = NameInputPage.new
    nameInputPage.fillinName
    nameInputPage.fillinLastName
    nameInputPage.clickNext
    fileUploadPage = FileUploadPage.new
    fileUploadPage.fillFileUpload
    fileUploadPage.clickNext
    signaturePage = SignaturePage.new
    signaturePage.verifySignatureField
    signaturePage.clickNext
    datePage = DatePage.new
    datePage.fillDate
    datePage.clickNext
    @@submitPage = SubmitPage.new
  end

  it 'complete the steps correctly to fill the form and submit' do
    #start browser session
    @@webform = WelcomePage.new(@@browser, "chrome")
    # fill the form with valid values with the function
    submitValidValuesUntilSecurityQuestionPage
    # continute the happy path scenario
    @@submitPage.selectNameOfFirstPet
    @@submitPage.clickSubmitButton
    thankyouPage = ThankYouPage.new
    thankyouPage.verifyFormSubmitted
    expect(class: 'jfThankYou-description form-subHeader')
    puts 'Form submitted successfully'
  end

  it 'should display a warning message if user does not choose an option for the security question dropdown and submits ' do
    #start browser session
    @@webform = WelcomePage.new(@@browser, "chrome")
    #call function to enter valid values until security quesion page
    submitValidValuesUntilSecurityQuestionPage
    #security question page --> will not choose a security question to verify error handling
    securityLabel = @@browser.label(id: 'label_10')
    if securityLabel.exists? == false
      fail "The page is not loaded"
    end
    # submits the form without choosing an option for the security question. expecting a warning
    @@submitPage.clickSubmitButton
    warningPane = @@browser.div(class: 'form-button-error')
    expect(warningPane)
    puts 'Test completed - Fix the errors in the forms'
  end

  it 'should open a mobile browser session and complete the form' do
    #create mobile browser session - iphone chrome default
    @@webform = WelcomePage.new(@@browser, "iphone")
    #@@webform.navigatetoNamePage
    @@browser.goto('https://form.jotform.com/201882323530347')
    nextButton = @@browser.button(css: "#jfCard-welcome-start")
    nextButton.wait_until_present
    nextButton.click
    puts "Webpage open and test started..."
    nameInputPage = NameInputPage.new
    nameInputPage.fillinName
    nameInputPage.fillinLastName
    nameInputPage.clickNextMobile
    fileUploadPage = FileUploadPage.new
    fileUploadPage.fillFileUpload
    fileUploadPage.clickNextMobile
    signaturePage = SignaturePage.new
    signaturePage.verifySignatureField
    signaturePage.clickNextMobile
    datePage = DatePage.new
    datePage.fillDateMobile
    datePage.clickNextMobile
    submitPage = SubmitPage.new
    # continute the happy path scenario
    submitPage.selectNameOfFirstPet
    submitPage.clickSubmitButtonMobile
    thankyouPage = ThankYouPage.new
    thankyouPage.verifyFormSubmitted
    expect(class: 'jfThankYou-description form-subHeader')
    puts 'Form submitted successfully - iphone chrome'
  end
  end
