def loader
  load "cmd/core.rb"
  load "cmd/cmds.rb"

  if $running
    load "main.rb"
  end

  $running = true
end
loader