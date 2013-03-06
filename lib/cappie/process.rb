require 'childprocess'

module Cappie
  class Process
    def initialize(options)
      @command = options.delete(:command)
      @await = options.delete(:await)
      @working_dir = options.delete(:working_dir)
      @environment = options.delete(:environment)
    end
    
    def start
      args = @command.split(' ')
      @proc = ChildProcess.build(*args)

      setup_cwd
      setup_environment

      r, w = IO.pipe

      @proc.io.stdout = @proc.io.stderr = w
    
      @proc.start
      w.close
    
      all_output = ""
    
      begin
        started = false
        until started
          partial = r.readpartial(8192)
          puts partial if ENV['CAPPIE_DEBUG']
          all_output << partial
          if (all_output =~ @await)
            started = true
          end
        end
      rescue EOFError
        raise "app exited:\n#{all_output}"
      end
      
      Thread.new do
        while true
          partial = r.readpartial(8192)
          puts partial if ENV['CAPPIE_DEBUG']
        end
      end
      
      at_exit do
        @proc.stop
      end
      
      @proc.io.inherit!
      
      @proc
    end

    private

    def setup_environment
      @environment.each { |key, value| @proc.environment[key] = value } unless @environment.nil?
    end

    def setup_cwd
      @proc.cwd = @working_dir unless @working_dir.nil?
    end
  end
end
