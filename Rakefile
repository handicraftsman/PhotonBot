task :default => :run

task :run do
  require "./requires"

  $pbversion = "0.0.0.1"

  require "./main"
  begin
    App.start!
  catch StandardError => e
    RG::Log.panic e.inspect
  end
end