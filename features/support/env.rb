require 'selenium-webdriver'
require 'webdrivers'
require 'cucumber'
require 'yaml'
require 'pry'

Before do
  @driver = Selenium::WebDriver.for :chrome
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  @driver.manage.window.maximize
end

After do
  @driver.quit
end