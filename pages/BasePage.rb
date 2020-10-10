require 'rspec'
require 'watir'
require 'webdrivers'
require 'ffi'
require 'webdriver-user-agent'

class BasePage
  @@browser = nil

  def initialize (browser, browsertype)
    @@browser = browser
    if browsertype == "safari"
      @@browser = Watir::Browser.new:safari, technology_preview: true
    elsif browsertype == "firefox"
      @@browser = Watir::Browser.new:firefox
    elsif browsertype == "edge"
      @@browser = Watir::Browser.new:edge
    elsif browsertype == "iphone"
      driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :iphone, :orientation => :portrait)
      @@browser = Watir::Browser.new(driver)
    else
      @@browser = Watir::Browser.new:chrome
    end
  end

  def navigateToWelcomePage
    @@browser.goto('https://form.jotform.com/201882323530347')
    return WelcomePage.new(@@browser)
  end

  def printPageTitle
    puts @@browser.title
    return @@browser.title
  end

end