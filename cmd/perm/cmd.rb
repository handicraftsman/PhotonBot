require_relative "db"

$err_noperms = "Your permission level is not high enough to execute this command"
class CMDNoPermError < StandardError
end

CmdHelp.new "admin", "sql", "sql <query>", "Executes given SQL-query (lvl10)"
oncmd(/sql (.+)/) do |m, data|
  query = data[1]
  if db_getperm(m.bot, m.host) >= 10
    db = $dbs[m.bot.name]
    out = db.execute query
    m.reply out
  else
    fail CMDNoPermError, $err_noperms
  end
end

CmdHelp.new "admin", "csql", "csql <server> <query>", "Cross-server counterpart of `sql` (lvl10)"
oncmd(/csql (.+?) (.+)/) do |m, data|
  query = data[2]
  if db_getperm(m.bot, m.host) >= 10
    db = $dbs[data[1]]
    out = db.execute query
    m.reply out
  else
    fail CMDNoPermError, $err_noperms
  end
end


CmdHelp.new "admin", "perm", "perm <host> [lvl]", "Gets `host`'s permission level. If `lvl` is present - sets it (lvl8)"
oncmd(/perm (.+) ([0-9]+)/) do |m, data|
  lvl = db_getperm(m.bot, m.host)
  if lvl >= 8
    if data[2].to_i < lvl
      db_setperm(m.bot, data[1], data[2].to_i)
      m.reply "OK!"
    else
      fail CMDNoPermError, "You cannot set someone's perm-level to #{data[2]}!"
    end
  else
    fail CMDNoPermError, "You cannot change permissions!"
  end
end
oncmd(/perm (.+)/) do |m, data|
  m.reply "#{data[1]}'s permission level is #{db_getperm(m.bot, data[1])}"
end

CmdHelp.new "admin", "cperm", "cperm <host> [lvl]", "Cross-server counterpart of `perm` (lvl10)"
oncmd(/cperm (.+?) (.+) ([0-9]+)/) do |m, data|
  lvl = db_getperm(m.bot, m.host)
  m.reply data[1].inspect
  if lvl >= 10
    if data[2].to_i < lvl
      db_setperm(App.bots[data[1]], data[2], data[3].to_i)
      m.reply "OK!"
    else
      fail CMDNoPermError, "You cannot set someone's perm-level to #{data[2]}!"
    end
  else
    fail CMDNoPermError, "You cannot change permissions!"
  end
end
oncmd(/cperm (.+?) (.+)/) do |m, data|
  m.reply "#{data[2]}'s permission level on #{data[1]} is #{db_getperm(App.bots[data[1]], data[2])}"
end