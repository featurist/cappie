$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'cappie/version'
require 'cappie/process'
require 'cappie/driver'

module Cappie
  def self.start(options)
    host = options.delete(:host)
    driver = options.delete(:driver) || :selenium
    Process.new(options).start
    Driver.new(driver, host)
  end
end
