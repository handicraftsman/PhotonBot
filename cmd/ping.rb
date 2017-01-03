CmdHelp.new "random", "ping", "ping", "Ping!"
oncmd(/ping/, 5) do |m, data|
  m.reply "pong"
end
oncmd(/ping (.+)/, 5) do |m, data|
  m.reply "pong #{data[1]}"
end