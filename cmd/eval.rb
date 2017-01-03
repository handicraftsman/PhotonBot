CmdHelp.new "admin", "rb", "rb <code>", "Executes given Ruby-code (lvl11)"
oncmd(/rb (.+?)/) do |m, data|
  if db_getperm(m.bot, m.host) == 11
    m.reply "Output: #{eval(data[1]).inspect}"
  else
    fail CMDNoPermError, $err_noperms
  end
end