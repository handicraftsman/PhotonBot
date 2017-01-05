# PRIVMSG
CmdHelp.new "utils", "msg", "msg <target> <text>", "Sends given message to the target (lvl5)"
oncmd(/msg (.+?) (.+)/, 0, 5) do |m, data|
  m.bot.a_privmsg(data[1], data[2])
  m.nreply "Sent!"
end

CmdHelp.new "utils", "cmsg", "cmsg <server> <target> <text>", "Cross-server counterpart of `msg` (lvl8)"
oncmd(/cmsg (.+?) (.+?) (.+)/, 0, 8) do |m, data|
  App.bots[data[1]].a_privmsg(data[2], data[3])
  m.nreply "Sent!"
end


# NOTICE
CmdHelp.new "utils", "notice", "notice <target> <text>", "Sends given notice to the target (lvl5)"
oncmd(/notice (.+?) (.+)/, 0, 5) do |m, data|
  m.bot.a_notice(data[1], data[2])
  m.nreply "Sent!"
end

CmdHelp.new "utils", "cnotice", "cnotice <server> <target> <text>", "Cross-server counterpart of `notice` (lvl8)"
oncmd(/cnotice (.+?) (.+?) (.+)/, 0, 8) do |m, data|
  App.bots[data[1]].a_notice(data[2], data[3])
  m.nreply "Sent!"
end

# NCTCP
CmdHelp.new "utils", "nctcp", "nctcp <target> <text>", "Sends notice-powered CTCP (lvl5)"
oncmd(/nctcp (.+?) (.+)/, 0, 5) do |m, data|
  m.bot.a_nctcp(data[1], data[2])
  m.nreply "Sent!" 
end

CmdHelp.new "utils", "cnctcp", "cnctcp <server> <target> <text>", "Cross-server counterpart of `nctcp` (lvl8)"
oncmd(/cnctcp (.+?) (.+?) (.+)/, 0, 8) do |m, data|
  App.bots[data[1]].a_nctcp(data[2], data[3])
  m.nreply "Sent!"
end

# ACTION
CmdHelp.new "utils", "action", "action <target> <text>", "Sends /me-message to the target (lvl5)"
oncmd(/action (.+?) (.+)/, 0, 5) do |m, data|
  m.bot.a_action(data[1], data[2])
  m.nreply "Sent!"
end

CmdHelp.new "utils", "caction", "caction <server> <target> <text>", "Cross-server counterpart of `action` (lvl8)"
oncmd(/caction (.+?) (.+?) (.+)/, 0, 8) do |m, data|
  App.bots[data[1]].a_action(data[2], data[3])
  m.nreply "Sent!"
end

# CTCP
CmdHelp.new "utils", "ctcp", "ctcp <target> <text>", "Sends CTCP to the target (lvl5)"
oncmd(/ctcp (.+?) (.+)/, 0, 5) do |m, data|
  m.bot.a_ctcp(data[1], data[2])
  m.nreply "Sent!"
end

CmdHelp.new "utils", "cctcp", "cctcp <server> <target> <text>", "Cross-server counterpart of `ctcp` (lvl8)"
oncmd(/cctcp (.+?) (.+?) (.+)/, 0, 8) do |m, data|
  App.bots[data[1]].a_ctcp(data[2], data[3])
  m.nreply "Sent!"
end

