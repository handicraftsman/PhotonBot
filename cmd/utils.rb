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
oncmd(/quit/, 0, 11) do |m, data|
  App.bots.each do |_, bot|
    bot.write "QUIT :Exiting..."
  end
  exit
end