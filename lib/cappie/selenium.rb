require 'selenium-webdriver'
require 'capybara/cucumber'

module Cappie
  class Selenium
    def initialize(app_host)
      Capybara.default_driver = :selenium
      Capybara.app_host = app_host
    end
  end
end