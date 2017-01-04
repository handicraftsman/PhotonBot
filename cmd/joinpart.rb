CmdHelp.new "admin", "join", "join <chans>", "Joins given chanlist (separated by comma) (lvl8)"
oncmd(/join (.+)/, 0, 8) do |m, data|
  m.bot.a_join "#{data[1]}"
  m.nreply "Sent!"
end

CmdHelp.new "admin", "part", "part <chans> [msg]", "Parts given chanlist (separated by comma). Leaves message if given (lvl8)"
oncmd(/part (.+?) (.+)/, 0, 8) do |m, data|
  m.bot.a_partm "#{data[1]}", "#{data[2]}"
  m.nreply "Sent!"
end
oncmd(/part (.+)/, 0, 8) do |m, data|
  m.bot.a_part "#{data[1]}"
  m.nreply "Sent!"
end


CmdHelp.new "admin", "cjoin", "cjoin <server> <chans>", "`join`'s cross-server counterpart (lvl9)"
oncmd(/cjoin (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_join "#{data[2]}"
  m.nreply "Sent!"
end

CmdHelp.new "admin", "cpart", "cpart <server> <chans> [msg]", "`part`'s cross-server counterpart (lvl9)"
oncmd(/cpart (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_partm "#{data[2]}", "#{data[3]}"
  m.nreply "Sent!"
end
oncmd(/cpart (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_part "#{data[2]}"
  m.nreply "Sent!"
end