CmdHelp.new("admin", "ignore", "ignore <target>", "Ignores target (lvl 8)")
oncmd(/ignore (.+)/, 0, 8) do |m, data|
  db_addignore(m.bot, data[1].antiinject)
  m.nreply "OK!"
end

CmdHelp.new("admin", "unignore", "unignore <target>", "Unignores target (lvl 8)")
oncmd(/unignore (.+)/, 0, 8) do |m, data|
  db_delignore(m.bot, data[1].antiinject)
  m.nreply "OK!"
end