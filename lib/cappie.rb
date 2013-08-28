$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'cappie/version'
require 'cappie/driver'
require 'procession'

module Cappie
  def self.start(options)
    host = options.delete(:host)
    driver = options.delete(:driver) || :selenium
    Procession::Process.new(options).start
    Driver.new(driver, host)
  end
end
