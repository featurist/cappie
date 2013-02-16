$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'cappie/version'
require 'cappie/process'
require 'cappie/selenium'

module Cappie
  def self.start(options)
    Process.new(options[:command], options[:await]).start  
    Selenium.new(options[:host])
  end
end