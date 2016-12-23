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
  db_setcalc(m.bot, data[1], "#{data[2]} [#{m.nick}] {#{DateTime.now.gregorian.strftime "%d.%m.%y"}}")
  m.reply "Done!"
end
oncmd(/calc (.+)/) do |m, data|
  m.reply "#{data[1]} = #{db_getcalc(m.bot, data[1])}"
end