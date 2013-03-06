$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'cappie/version'
require 'cappie/process'
require 'cappie/selenium'

module Cappie
  def self.start(options)
    host = options.delete(:host)
    Process.new(options).start  
    Selenium.new(host)
  end
end
