CmdHelp.new "admin", "join", "join <chans>", "Joins given chanlist (separated by comma) (lvl8)"
oncmd(/join (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 8
    m.bot.a_join "#{data[1]}"
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end
end

CmdHelp.new "admin", "part", "part <chans> [msg]", "Parts given chanlist (separated by comma). Leaves message if given (lvl8)"
oncmd(/part (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 8
    m.bot.a_partm "#{data[1]}", "#{data[2]}"
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end
end
oncmd(/part (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 8
    m.bot.a_part "#{data[1]}"
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end
end


CmdHelp.new "admin", "cjoin", "cjoin <server> <chans>", "`join`'s cross-server counterpart (lvl10)"
oncmd(/cjoin (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 10
    App.bots[data[1]].a_join "#{data[2]}"
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end
end

CmdHelp.new "admin", "cpart", "cpart <server> <chans> [msg]", "`part`'s cross-server counterpart (lvl10)"
oncmd(/cpart (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 10
    App.bots[data[1]].a_partm "#{data[2]}", "#{data[3]}"
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end
end
oncmd(/cpart (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 10
    App.bots[data[1]].a_part "#{data[2]}"
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end
end