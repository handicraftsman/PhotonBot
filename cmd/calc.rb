def db_getcalc(bot, name)
  db = $dbs[bot.name]
  rows = db.execute <<-SQL
    select * from calcs where name="#{name}";
  SQL
  if rows == []
    return ""
  end
  return rows[0][1]
end

def db_setcalc(bot, name, text)
  db = $dbs[bot.name]
  rows = db.execute <<-SQL
    select * from calcs where name="#{name}";
  SQL
  if rows == []
    db.execute %{insert into calcs (name, text) values ("#{name}", "#{text}");}
  else
    db.execute %{update calcs set text = "#{text}" where name = "#{name}";}
  end
end

def db_delcalc(bot, name)
  db = $dbs[bot.name]
  rows = db.execute <<-SQL
    select * from calcs where name="#{name}";
  SQL
  unless rows == []
    db.execute %{delete from calcs where name="#{name}"}
  end
end

CmdHelp.new "random", "calc", "calc <name> [= text]", "Displays calc by `name`. If `text` is present - sets it"
oncmd(/calc (.+) = nil/) do |m, data|
  db_delcalc(m.bot, data[1].squish)
  m.reply "Done!"
end 
oncmd(/calc (.+) = (.+)/) do |m, data|
  db_setcalc(m.bot, data[1].squish, "#{data[2].squish.force_encoding("UTF-8")} [#{m.nick}!#{m.user}] {#{DateTime.now.gregorian.strftime "%d.%m.%y"}}")
  m.reply "Done!"
end
oncmd(/calc (.+)/) do |m, data|
  m.reply "#{data[1].squish} = #{db_getcalc(m.bot, data[1].squish.force_encoding("UTF-8"))}"
end