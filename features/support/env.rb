require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'

@browser = ENV['BROWSER']

if @browser.eql?('headless')


  Capybara.register_driver :selenium do |app|
  browser_options = ::SeleniumWebDriver::Chrome::Options.new
  browser_options.args << '--headless'
  browser_options.args << '--no-default-browser-check'
  browser_options.args << '--disable-gpu' if Gem.win_platform?
  Capybara::Selenium::Driver.new(app, browser: :remote, url: 'http://selenium:4444/wd/hub')
  end

  Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless
  config.app_host = 'https://mark7-sandbox.herokuapp.com'

  Capybara.default_max_wait_time = 5
  end
else
  Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'https://mark7-sandbox.herokuapp.com'

  Capybara.default_max_wait_time = 5
  end
end
