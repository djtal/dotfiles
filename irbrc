require 'irb/completion'
require 'irb/ext/save-history'
require 'interactive_editor'


ARGV.concat [ "--readline",
              "--prompt-mode",
	                    "simple" ]

# 1000 entries in the list
IRB.conf[:SAVE_HISTORY] = 1000

# Store results in home directory with specified file name
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

#show sl log into console
if ENV['RAILS_ENV']
  # Called after the irb session is initialized and Rails has been loaded
  IRB.conf[:IRB_RC] = Proc.new do
    logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = logger
   end
end


# hide sql log from rails console
# from http://stackoverflow.com/questions/4103205/how-to-disable-the-logger-in-script-console

def show_log
  change_log(STDOUT)
end

def hide_log
  change_log(nil)
end

def change_log(stream, colorize=true)
  ActiveRecord::Base.logger = ::Logger.new(stream)
  ActiveRecord::Base.clear_all_connections!
  ActiveRecord::Base.colorize_logging = colorize
  nil
end

