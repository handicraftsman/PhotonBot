CmdHelp.new "admin", "r", "r", "Reloads all commands and bot classes (lvl10)"
oncmd(/r/) do |m, data|
  if db_getperm(m.bot, m.host) >= 10
    reload
    m.reply "Done!"
  else
    fail CMDNoPermError, $err_noperms
  end
end

CmdHelp.new "utils", "servs", "servs", "Shows server list"
oncmd(/servs/) do |m, data|
  str = "Server list: "
  App.bots.each do |name, _|
    str << name + " "
  end
  m.reply str
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


CmdHelp.new "admin", "quit", "quit", "Stops PhotonBot (lvl11)"
oncmd(/quit/) do |m, data|
  if db_getperm(m.bot, m.host) == 11
    App.bots.each do |_, bot|
      bot.write "QUIT :Exiting..."
    end
    exit
  else
    fail CMDNoPermError, $err_noperms
  end
end