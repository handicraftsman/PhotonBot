CmdHelp.new "random", "ping", "ping", "Ping!"
oncmd(/ping/) do |m, data|
  m.reply "pong"
end