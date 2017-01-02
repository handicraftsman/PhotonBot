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

CmdHelp.new "random", "calc", "calc <name> [= text]", "Displays calc by `name`. If `text` is present - sets it"
oncmd(/calc (.+) = (.+)/) do |m, data|
  if /^nil/.match data[1].squish
    db_setcalc(m.bot, data[1].squish, "")
  else
    db_setcalc(m.bot, data[1].squish, "#{data[2].squish} [#{m.nick}!#{m.user}] {#{DateTime.now.gregorian.strftime "%d.%m.%y"}}")
  end
  m.reply "Done!"
end
oncmd(/calc (.+)/) do |m, data|
  m.reply "#{data[1].squish} = #{db_getcalc(m.bot, data[1].squish)}"
end