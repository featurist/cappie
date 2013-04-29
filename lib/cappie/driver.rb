require 'selenium-webdriver'
require 'capybara/poltergeist'
require 'capybara/cucumber'

module Cappie
  class Driver
    def initialize(driver, app_host)
      Capybara.default_driver = driver.to_sym
      Capybara.app_host = app_host
    end
  end
end
