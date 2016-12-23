# PRIVMSG
CmdHelp.new "utils", "msg", "msg <target> <text>", "Sends given message to the target (lvl5)"
oncmd(/msg (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 5
    m.bot.a_privmsg(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

CmdHelp.new "utils", "cmsg", "cmsg <server> <target> <text>", "Cross-server counterpart of `msg` (lvl8)"
oncmd(/cmsg (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 5
    App.bots[data[1]].a_privmsg(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end


# NOTICE
CmdHelp.new "utils", "notice", "notice <target> <text>", "Sends given notice to the target (lvl5)"
oncmd(/notice (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 5
    m.bot.a_notice(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

CmdHelp.new "utils", "cnotice", "cnotice <server> <target> <text>", "Cross-server counterpart of `notice` (lvl8)"
oncmd(/cnotice (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 5
    App.bots[data[1]].a_notice(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

# NCTCP
CmdHelp.new "utils", "nctcp", "nctcp <target> <text>", "Sends notice-powered CTCP (lvl5)"
oncmd(/notice (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 5
    m.bot.a_nctcp(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

CmdHelp.new "utils", "cnctcp", "cnctcp <server> <target> <text>", "Cross-server counterpart of `nctcp` (lvl8)"
oncmd(/cnctcp (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 5
    App.bots[data[1]].a_nctcp(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

# ACTION
CmdHelp.new "utils", "action", "action <target> <text>", "Sends /me-message to the target (lvl5)"
oncmd(/action (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 5
    m.bot.a_action(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

CmdHelp.new "utils", "caction", "caction <server> <target> <text>", "Cross-server counterpart of `action` (lvl8)"
oncmd(/caction (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 5
    App.bots[data[1]].a_action(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

# CTCP
CmdHelp.new "utils", "ctcp", "ctcp <target> <text>", "Sends CTCP to the target (lvl5)"
oncmd(/ctcp (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 5
    m.bot.a_ctcp(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

CmdHelp.new "utils", "cctcp", "cctcp <server> <target> <text>", "Cross-server counterpart of `ctcp` (lvl8)"
oncmd(/cctcp (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 5
    App.bots[data[1]].a_ctcp(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

