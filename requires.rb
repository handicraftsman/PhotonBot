require "rubygoods"
#unless RUBY_PLATFORM == "java"
  require "sqlite3"
#else
#  require "activerecord-jdbcsqlite3-adapter" #Buggy
#end

require "date"
require "yaml"
require "socket"

require "irb"

RG::Log.write "Finished loading libraries"