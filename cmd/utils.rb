# Admin
CmdHelp.new "admin", "r", "r", "Reloads all commands and bot classes (lvl10)"
oncmd(/r/, 0, 10) do |m, data|
  reload
  m.nreply "Done!"
end

CmdHelp.new "utils", "servs", "servs", "Shows server list"
oncmd(/servs/) do |m, data|
  str = "Server list: "
  App.bots.each do |name, _|
    str << name + " "
  end
  m.nreply str
end

CmdHelp.new "admin", "quit", "quit", "Stops PhotonBot (lvl11)"
oncmd(/quit/, 0, 11) do |m, data|
  App.bots.each do |_, bot|
    bot.write "QUIT :Exiting..."
  end
  exit
end

CmdHelp.new "admin", "flushq", "flushq", "Flushes queue (lvl9)"
oncmd(/flushq/, 0, 9) do |m, data|
  m.bot.queue.clear
  m.nreply "Flushed queue!"
end

CmdHelp.new "admin", "cflushq", "cflushq <server>", "Cross-server counterpart of `flushq` (lvl10)"
oncmd(/cflushq (.+)/, 0, 10) do |m, data|
  App.bots[data[1]].queue.clear
  m.nreply "Flushed queue!"
end

CmdHelp.new "admin", "raw", "raw <data>", "Sends raw data to socket (lvl10)"
oncmd(/raw (.+)/, 0, 10) do |m, data|
  m.bot.write data[1]
  m.nreply "Sent!"
end

CmdHelp.new "admin", "craw", "craw <server> <data>", "Cross-server counterpart of `raw` (lvl11)"
oncmd(/craw (.+?) (.+)/, 0, 11) do |m, data|
  App.bots[data[1]].write data[2]
  m.nreply "Sent!"
end

CmdHelp.new "admin", "nick", "nick <nick>", "Changes nick (lvl10)"
oncmd(/nick (.+)/, 0, 10) do |m, data|
  m.bot.write "NICK " + data[1]
  m.nreply "Sent!"
end

CmdHelp.new "admin", "cnick", "cnick <server> <nick>", "Cross-server counterpart of `nick` (lvl11)"
oncmd(/cnick (.+) (.+)/, 0, 11) do |m, data|
  App.bots[data[1]].write "NICK " + data[2]
  m.nreply "Sent!"
end

# CTCP
onctcp(/VERSION/) do |m, data|
  m.bot.a_nctcp m.nick, "VERSION PhotonBot v#{$pbversion}. " +
    "Ruby v#{RUBY_VERSION}-#{RUBY_PATCHLEVEL} on #{RUBY_PLATFORM}. " + 
    "RubyGoods v#{RG.getgemver("rubygoods")}. SQLite3 v#{RG.getgemver("sqlite3")}"
end

onctcp(/TIME/) do |m, data|
  m.bot.a_nctcp m.nick, "TIME #{DateTime.now.gregorian.strftime "%d.%m.%Y|%H:%M:%S"}"
end

CmdHelp.new "utils", "title", "title <http(s)://example.com>", "Gets title of given HTML page URL"
oncmd(/title (http[s]{0,1}:\/\/.+?)/) do |m, data|
  dat = HTTP.get(data[1])
  #m.nreply(data[1] + " | " + dat.code) # Remove that after finishing
  while (dat.code == 301) or (dat.code == 302)
    #m.nreply(data[1] + " | " + dat.code) # Remove that after finishing
    dat = HTTP.get(dat["Location"])
  end

  if dat["Content-Type"][/text\/html.*/]
    if dat.code != 200
      m.reply "[#{data[1]} : Code #{dat.code}]"
    else
      h = Nokogiri::HTML(dat.body.to_s)
      o = h.css("title").children.to_s
      m.reply "[#{data[1]} | #{o}]"
    end
  end
end