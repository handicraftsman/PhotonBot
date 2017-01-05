require_relative "db"

$err_noperms = "Your permission level is not high enough to execute this command"
class CMDNoPermError < StandardError
end

CmdHelp.new "admin", "sql", "sql <query>", "Executes given SQL-query (lvl10)"
oncmd(/sql (.+)/, 0, 10) do |m, data|
  query = data[1]
  db = $dbs[m.bot.name]
  out = db.execute query
  m.nreply out
end

CmdHelp.new "admin", "csql", "csql <server> <query>", "Cross-server counterpart of `sql` (lvl10)"
oncmd(/csql (.+?) (.+)/, 0, 10) do |m, data|
  query = data[2]
  db = $dbs[data[1]]
  out = db.execute query
  m.nreply out
end

CmdHelp.new "admin", "esql", "esql <query>", "Executes given SQL-query on all servers (lvl11)"
oncmd(/esql (.+)/, 0, 11) do |m, data|
  query = data[1]
  $dbs.each do |name, db|
    out = db.execute query
    m.nnreply "SQL: #{name} -> #{out}"
  end
end

CmdHelp.new "admin", "perm", "perm <host>", "Gets `host`'s permission level."
CmdHelp.new "admin", "setperm", "setperm <host> <lvl>", "Sets `host`'s permission level. (lvl8)"
oncmd(/setperm (.+?) (\d+)/, 0, 8) do |m, data|
  lvl = db_getperm(m.bot, m.host)
  if data[2].to_i < lvl
    db_setperm(m.bot, data[1], data[2].to_i)
    m.nreply "OK!"
  else
    fail CMDNoPermError, "You cannot set someone's perm-level to #{data[2]}!"
  end
end
oncmd(/perm (.+?)/) do |m, data|
  m.nreply "#{data[1]}'s permission level is #{db_getperm(m.bot, data[1])}"
end

CmdHelp.new "admin", "csetperm", "cperm <server> <host>", "Cross-server counterpart of `perm`"
CmdHelp.new "admin", "csetperm", "csetperm <server> <host> <lvl>", "Cross-server counterpart of `setperm` (lvl10)"
oncmd(/csetperm (.+?) (.+?) (\d+)/, 0, 10) do |m, data|
  lvl = db_getperm(m.bot, m.host)
  if data[2].to_i < lvl
    db_setperm(App.bots[data[1]], data[2], data[3].to_i)
    m.nreply "OK!"
  else
    fail CMDNoPermError, "You cannot set someone's perm-level to #{data[2]}!"
  end
end
oncmd(/cperm (.+?) (.+?)/) do |m, data|
  m.nreply "#{data[2]}'s permission level on #{data[1]} is #{db_getperm(App.bots[data[1]], data[2])}"
end