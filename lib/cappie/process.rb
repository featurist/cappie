require 'childprocess'

module Cappie
  class Process
    def initialize(command, await)
      @command = command
      @await = await
    end
    
    def start
      args = @command.split(' ')
      @proc = ChildProcess.build(*args)

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
        @proc.stop 0
      end
      
      @proc.io.inherit!
      
      @proc
    end
  end
end